package com.myself.gecko.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class AnswerDaoImpl extends BaseDaoImpl<Answer> implements IAnswerDao {

	@Override
	public List<Answer> findListByQid(int qid) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from answer where qid = ?";
		return queryRunner.query(sql, new BeanListHandler<>(Answer.class), qid);
	}

	@Override
	public List<Answer> ajaxLoad(int currentPage, int qid, User user) throws Exception {
		int uid = 0;
		if (user != null) {
			uid = user.getId();
		}

		String whereClause = "where qid = " + qid;
		List<Answer> list = selectLimitByWhere(currentPage, Constant.ANSWER_AJAX_LOAD_COUNT, whereClause);
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		for (Answer answer : list) {
			improveAnswerInfo(answer, queryRunner, uid);
		}
		return list;
	}
	
	public void improveAnswerInfo(Answer answer, QueryRunner queryRunner, int uid) throws Exception {
		String sql = "select user.id, user.name, user.sentence,user.photo from user join answer on answer.uid = user.id where answer.id = ?";
		Map<String, Object> map = queryRunner.query(sql, new MapHandler(), answer.getId());
		User author = new User();
		BeanUtils.populate(author, map);
		answer.setUser(author);

		// 查询赞同数
		sql = "select count(*) from answer_agree where aid = ?";
		Long agreeCount = (Long) queryRunner.query(sql, new ScalarHandler(), answer.getId());
		answer.setAgreeCount(agreeCount.intValue());
		
		// 查询评论数
		sql = "select count(*) from comment where type = ? and targetId = ?";
		Long commentCount = (Long) queryRunner.query(sql, new ScalarHandler(), Constant.COMMENT_TYPE_ANSWER, answer.getId());
		answer.setCommentCount(commentCount.intValue());
		
		//查询我是否点过赞
		if (uid != 0) {
			sql = "select count(*) from answer_agree where aid = ? and uid = ?";
			Long agree = (Long) queryRunner.query(sql, new ScalarHandler(), answer.getId(), uid);
			answer.setAgree(agree.intValue());
		}
	}

	@Override
	public void save(Answer answer) throws Exception {
		String sql = "insert into answer values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = { null, answer.getUser().getId(), answer.getQuestion().getId(), answer.getAnonymous(),
				answer.getPureContent(), answer.getContent(), answer.getDate(), answer.getCommentCount(),
				answer.getAgreeCount() };
		CU(sql, params);
	}

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

	@Override
	public void disagree(User user, int aid) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from answer_agree where aid = ? and uid = ?";
		queryRunner.update(sql, aid, uid);
	}

	@Override
	public Answer findAnswerByOrderStyle(int qid, User user, String orderStyle) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = null;
		if ("hot".equals(orderStyle)) {
			sql = "select * from answer where id = (select answer.id from answer left join answer_agree on answer.id = answer_agree.aid where answer.qid = ? group by answer.id order by count(answer_agree.id) desc limit 0, 1)";
		} else {
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

    @Override
    public Answer findNewestAnswer(int id) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select * from answer where qid = ? order by date limit 1";
        sql = "select distinct question.id, question.title from question left join question_watch on question.id = question_watch.qid where question_watch.uid = ?";
        return queryRunner.query(sql, new BeanHandler<>(Answer.class), id);  
    }

    @Override
    public List<Answer> findNewestAnswerInWatchedQuestion(User user, int currentPage, int pageSize)
            throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select distinct answer.id from answer left join question on question.id = answer.qid join question_watch on question.id = question_watch.qid where question_watch.uid = ? order by answer.date desc limit ?, ?";
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, user.getId());
        }
        return list;
    }
    
    @Override
    public List<Answer> findAnswersByUserWatch(User user, int currentPage, int pageSize) throws Exception {
        String sql = "select answer.id from answer left join user u1 on u1.id = answer.uid join user_watch on user_watch.hostId = u1.id join user u2 on u2.id = user_watch.watcherId where u2.id = ? limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Answer> list = queryRunner.query(sql, new BeanListHandler<>(Answer.class), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Answer answer : list) {
            improveAnswerInfo(answer, queryRunner, user.getId());
        }
        return list;
    }

}
