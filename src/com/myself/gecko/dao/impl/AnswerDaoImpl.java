package com.myself.gecko.dao.impl;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.ietf.jgss.Oid;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;
import com.sun.org.apache.bcel.internal.generic.NEW;

@SuppressWarnings("all")
public class AnswerDaoImpl extends BaseDaoImpl<Answer> implements IAnswerDao {

    private Answer comment;

    /**  
     * 根据Qid查询所有回答
     */
    @Override
    public List<Answer> findAllByQid(int qid) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select * from answer where qid = ?";
        return queryRunner.query(sql, new BeanListHandler<>(Answer.class), qid);
    }

    /**  
     * 根据Qid查询回答
     */
    @Override
    public List<Answer> findListByQid(int currentPage,int pageSize, int qid, User user) throws Exception {
        int uid = 0;
        if (user != null) {
            uid = user.getId();
        }

        String whereClause = "where qid = " + qid;
        List<Answer> list = selectLimitByWhere(currentPage, pageSize, whereClause);
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, uid);
        }
        return list;
    }

    /**  
     * 完善回答
     */
    public void improveAnswerInfo(Answer answer, QueryRunner queryRunner, int uid)
            throws Exception {
        // 查询作者
        String sql =
                "select user.id, user.name, user.sentence,user.photo from user join answer on answer.uid = user.id where answer.id = ?";
        Map<String, Object> map = queryRunner.query(sql, new MapHandler(), answer.getId());
        User author = new User();
        BeanUtils.populate(author, map);
        answer.setUser(author);

        // 查询问题
        sql = "select question.id, question.title from question, answer where answer.qid = question.id and answer.id = ?";
        Question question =
                queryRunner.query(sql, new BeanHandler<>(Question.class), answer.getId());
        answer.setQuestion(question);

        // 查询赞同数
        sql = "select count(*) from answer_agree where aid = ?";
        Long agreeCount = (Long) queryRunner.query(sql, new ScalarHandler(), answer.getId());
        answer.setAgreeCount(agreeCount.intValue());

        // 所属话题
        sql = "select topic.id, topic.name from topic,question,answer where topic.id = question.tid and question.id = answer.qid and answer.id = ?";
        Topic topic = queryRunner.query(sql, new BeanHandler<>(Topic.class), answer.getId());
        answer.setTopic(topic);

        // 查询评论数
        sql = "select count(*) from comment where type = ? and targetId = ?";
        Long commentCount = (Long) queryRunner.query(sql, new ScalarHandler(),
                Constant.COMMENT_TYPE_ANSWER, answer.getId());
        answer.setCommentCount(commentCount.intValue());

        // 查询我是否点过赞
        if (uid != 0) {
            sql = "select count(*) from answer_agree where aid = ? and uid = ?";
            Long agree = (Long) queryRunner.query(sql, new ScalarHandler(), answer.getId(), uid);
            answer.setAgree(agree.intValue());
        }
    }

    /**  
     * 保存
     */
    @Override
    public void save(Answer answer) throws Exception {
        String sql = "insert into answer values(?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {null, answer.getUser().getId(), answer.getQuestion().getId(),
                answer.getAnonymous(), answer.getPureContent(), answer.getContent(), answer.getDate()};
        CU(sql, params);
    }

    // 点赞
    @Override
    public void agree(User user, int aid) throws Exception {
        int uid = user.getId();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select count(*) from answer_agree where aid = ? and uid = ?";
        Long count = (Long) queryRunner.query(sql, new ScalarHandler(), aid, uid);
        if (count.intValue() == 0) {
            sql = "insert into answer_agree values(null, ?, ?, ?)";
            queryRunner.update(sql, aid, uid, new Date());
        }
    }

    // 取消点赞
    @Override
    public void disagree(User user, int aid) throws Exception {
        int uid = user.getId();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delete from answer_agree where aid = ? and uid = ?";
        queryRunner.update(sql, aid, uid);
    }

    /**  
     * 按照不同排序方式查询回答
     */
    @Override
    public Answer findAnswerByOrderStyle(int qid, User user, String orderStyle) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = null;
        if ("hot".equals(orderStyle)) {
            //查询获赞最多的回答
            sql = "select * from answer where id = (select answer.id from answer left join answer_agree on answer.id = answer_agree.aid where answer.qid = ? group by answer.id order by count(answer_agree.id) desc limit 0, 1)";
        } else {
            //查询最新的回答
            sql = "select * from answer where qid = ? order by date desc limit 0, 1";
        }
        Answer answer = queryRunner.query(sql, new BeanHandler<>(Answer.class), qid);

        if (answer != null) {
            int uid = 0;
            if (user != null) {
                uid = user.getId();
            }
            improveAnswerInfo(answer, queryRunner, uid);
        }
        return answer;
    }

    /**  
     * 查看关注的问题中新增的回答  
     */
    @Override
    public List<Answer> findNewestAnswerInWatchedQuestion(User user, int currentPage, int pageSize)
            throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql =
                "select answer.* from answer left join question on question.id = answer.qid join question_watch on question.id = question_watch.qid where question_watch.uid = ? order by answer.date desc limit ?, ?";
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class),
                user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, user.getId());
        }
        return list;
    }

    /**  
     * 查看关注的用户添加/点赞的回答
     */
    @Override
    public List<Answer> findAnswersByUserWatch(User user, int currentPage, int pageSize)
            throws Exception {
        // 关注的好友新增加的回答
        String sql =
                "select answer.* from answer join user u1 on u1.id = answer.uid join user_watch on user_watch.hostId = u1.id where user_watch.watcherId = ? limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class),
                user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, user.getId());
            answer.setMark(11);
        }

        // 关注的好友点赞的回答
        sql = "select answer.id, uw.watcherId from answer join answer_agree aa on aa.aid = answer.id join user u1 on u1.id = aa.uid join user_watch uw on uw.hostId = u1.id where uw.watcherId = ? limit ?,?";
        List<Map<String, Object>> list2 = queryRunner.query(sql, new MapListHandler(), user.getId(),
                (currentPage - 1) * pageSize, pageSize);
        for (Map<String, Object> map : list2) {
            Answer answer = findById((int) map.get("id"));
            improveAnswerInfo(answer, queryRunner, user.getId());
            answer.setMark(21);

            int uid = (int) map.get("watcherId");
            sql = "select id, name from user where id = ?";
            User watcher = queryRunner.query(sql, new BeanHandler<>(User.class), uid);
            answer.setWatcher(watcher);
            list.add(answer);
        }
        return list;
    }

    /**  
     * 查询最新的回答
     */
    @Override
    public List<Answer> findNewestAnswers(int currentPage, int pageSize) throws Exception {
        String whereClause = "order by date desc";
        List<Answer> list = selectLimitByWhere(currentPage, pageSize, whereClause);
        for (Answer answer : list) {
            improveAnswerInfo(answer, new QueryRunner(C3P0Utils.getDataSource()), 0);
        }
        return list;
    }
    
    /**  
     * 查询今日最热回答
     */
    @Override
    public List<Answer> findHotday(User user, int currentPage, int pageSize) throws Exception {
        Date date = new Date();
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);

        String sql = "select * from answer where date > ? order by date desc limit ?, ?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        Object[] param = {date, (currentPage - 1) * pageSize, pageSize};
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class), param);
        
        int uid = 0;
        if (user != null) {
            uid = user.getId();
        }
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, uid);
        }
        return list;
    }

    /**  
     * 查询本月最热回答
     */
    @Override
    public List<Answer> findHotmonth(User user, int currentPage, int pageSize) throws Exception {
        Date date = new Date();
        date.setDate(0);
        date.setHours(0);
        date.setMinutes(0);
        date.setSeconds(0);

        String sql = "select * from answer where date > ? order by date desc limit ?, ?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        Object[] param = {date, (currentPage - 1) * pageSize, pageSize};
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class), param);
        
        int uid = 0;
        if (user != null) {
            uid = user.getId();
        }
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, uid);
        }
        return list;
    }

    /**  
     * 根据UID查询用户点过赞的回答
     */
    @Override
    public List<Answer> findAgreedAnswer(User user, int uid, int currentPage, int pageSize)
            throws Exception {
        ArrayList<Answer> list = new ArrayList<>();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select answer.id from answer join answer_agree aa on aa.aid = answer.id where aa.uid = ? limit ?,?";
        List<Map<String, Object>> list2 = queryRunner.query(sql, new MapListHandler(), uid,
                (currentPage - 1) * pageSize, pageSize);
        int id = 0;
        if(user != null) {
            id = user.getId();
        }
        for (Map<String, Object> map : list2) {
            Answer answer = findById((int) map.get("id"));
            if(answer != null) {
                improveAnswerInfo(answer, queryRunner, id);
                list.add(answer);
            }
        }
        return list;
    }
    
    /**  
     * 根据用户查询该用户的回答
     * @throws Exception 
     */
    @Override
    public List<Answer> findByUid(User user, int uid, int currentPage, int pageSize) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String whereClause = "where uid = " + uid;
        List<Answer> list = selectLimitByWhere(currentPage, pageSize, whereClause);
        int id = 0;
        if(user != null) {
            id = user.getId();
        }
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, id);
        }
        return list;
    }

    @Override
    public int findAuthorByAid(int aid) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select uid from answer where id = ?";
        return (int) queryRunner.query(sql, new ScalarHandler(), aid);
    }

    /**  
     * 根据aid删除回答
     */
    @Override
    public void deleteByAid(int aid) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        // ----------------删除回答赞同----------------
        String sql = "delete from answer_agree where aid = ?";
        queryRunner.update(sql, aid);
        
        //-------------------删除回答-----------------------
        sql = "delete from answer where id = ?";
        queryRunner.update(sql, aid);
    }
    
}