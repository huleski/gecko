package com.myself.gecko.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class ArticleDaoImpl extends BaseDaoImpl<Article> implements IArticleDao {

    /**  
     * 保存
     */
    @Override
    public void save(Article article) throws Exception {
        String sql = "insert into article values(?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {null, article.getUser().getId(), article.getTopic().getId(),
                article.getTitlePicture(), article.getTitle(), article.getPureContent(),
                article.getContent(), article.getDate()};
        CU(sql, params);
    }

    /**  
     * 点赞
     */
    @Override
    public void agree(User user, int aid) throws Exception {
        int uid = user.getId();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select count(*) from article_agree where aid = ? and uid = ?";
        Long count = (Long) queryRunner.query(sql, new ScalarHandler(), aid, uid);
        if (count.intValue() == 0) {
            sql = "insert into article_agree values(null, ?, ?, ?)";
            queryRunner.update(sql, aid, uid, new Date());
        }
    }

    /**  
     * 取消点赞
     */
    @Override
    public void disagree(User user, int aid) throws Exception {
        int uid = user.getId();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delete from article_agree where aid = ? and uid = ?";
        queryRunner.update(sql, aid, uid);
    }

    /**  
     * 根据id查找文章
     */
    @Override
    public Article findAnswerById(int aid, User user) throws Exception {
        Article article = findById(aid);

        String sql = "select uid, tid from article where id = ?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        Map<String, Object> map = queryRunner.query(sql, new MapHandler(), aid);

        // 封装作者
        sql = "select * from user where id = ?";
        User author = queryRunner.query(sql, new BeanHandler<>(User.class), map.get("uid"));
        article.setUser(author);

        // 封装话题
        sql = "select * from topic where id = ?";
        Topic topic = queryRunner.query(sql, new BeanHandler<>(Topic.class), map.get("tid"));
        article.setTopic(topic);

        // 查询赞同数
        sql = "select count(*) from article_agree where aid = ?";
        Long agreeCount = (Long) queryRunner.query(sql, new ScalarHandler(), aid);
        article.setAgreeCount(agreeCount.intValue());

        // 查询评论数
        sql = "select count(*) from comment where type = ? and targetId = ?";
        Long commentCount = (Long) queryRunner.query(sql, new ScalarHandler(),
                Constant.COMMENT_TYPE_ARTICLE, aid);
        article.setCommentCount(commentCount.intValue());

        // 查询是否点过赞
        if (user != null) {
            int uid = user.getId();
            sql = "select count(*) from article_agree where aid = ? and uid = ?";
            Long agree = (Long) queryRunner.query(sql, new ScalarHandler(), aid, uid);
            article.setAgree(agree.intValue());
        }
        return article;
    }

    /**  
     * 根据tid查询和排序方式查询文章
     */
    @Override
    public List<Article> findArticleByOrderStyle(int tid, User user, String orderStyle,
            int currentPage, int pageSize) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = null;
        if ("hot".equals(orderStyle)) {
            sql = "select article.id from article left join article_agree on article.id = article_agree.aid where tid = ? group by article.id order by count(article_agree.id) desc limit ?, ?";
        } else {
            sql = "select id from article where tid = ? order by date desc limit ?, ?";
        }
        List<Article> aList = queryRunner.query(sql, new BeanListHandler<>(Article.class), tid,
                (currentPage - 1) * pageSize, pageSize);
        List<Article> list = new ArrayList<>();

        for (Article article : aList) {
            article = findAnswerById(article.getId(), user);
            list.add(article);
        }
        return list;
    }

    /**  
     * 查询关注的用户新添加/点赞的文章
     */
    @Override
    public List<Article> findArticlesByUserWatch(User user, int currentPage, int pageSize) throws Exception {
        ArrayList<Article> list = new ArrayList<>();
        //查询关注用户新增的文章
        String sql = "select article.id from article join user u1 on u1.id = article.uid join user_watch on user_watch.hostId = u1.id where user_watch.watcherId = ? limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Map<String, Object>> tempList = queryRunner.query(sql, new MapListHandler(), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Map<String, Object> map : tempList) {
            Article article = findAnswerById((int) map.get("id"), user);
            article.setMark(12);
            list.add(article);
        }

        //查询关注用户赞同的文章
        sql = "select article.id, uw.watcherId from article join article_agree aa on aa.aid = article.id join user u1 on u1.id = aa.uid join user_watch uw on uw.hostId = u1.id where uw.watcherId = ? limit ?,?";
        List<Map<String, Object>> list2 = queryRunner.query(sql, new MapListHandler(), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Map<String, Object> map : list2) {
            Article article = findAnswerById((int) map.get("id"), user);
            article.setMark(22);
            int uid = (int) map.get("watcherId");
            sql = "select id, name from user where id = ?";
            User watcher = queryRunner.query(sql, new BeanHandler<>(User.class), uid);
            article.setWatcher(watcher);
            list.add(article);
        }
        return list;
    }

    /**  
     * 查询最新的文章
     */
    @Override
    public List<Article> findNewestArticles(int currentPage, int pageSize) throws Exception {
        String whereClause = "order by date desc";
        List<Article> aList = new ArrayList<>(); 
        List<Article> list = selectLimitByWhere(currentPage, pageSize, whereClause );
        for (Article article : list) {
            Article a = findAnswerById(article.getId(), null);
            aList.add(a);
        }
        return aList;
    }

    /**  
     * 查询关注的话题中增加的文章
     */
    @Override
    public List<Article> findNewestArticlesInWatchedTopics(User user, int currentPage, int pageSize)
            throws Exception {
        List<Article> aList = new ArrayList<>(); 
        String sql = "select article.id from article join topic t on t.id = article.tid join topic_watch tw on tw.tid = t.id where tw.uid = ? limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Article> list = queryRunner.query(sql, new BeanListHandler<>(Article.class), user.getId(), (currentPage - 1) * pageSize, pageSize);
        for (Article article : list) {
            Article a = findAnswerById(article.getId(), user);
            aList.add(a);
        }
        return aList;
    }

    /**  
     * 根据关键字查询相关文章
     */
    @Override
    public List<Article> findAssociatedByKeywords(String keywords, User user, int currentPage, int pageSize) throws Exception {
        List<Article> aList = new ArrayList<>(); 
        String sql = "select a.id from article a left join article_agree ag on a.id = ag.aid where a.title like ? group by a.id order by count(a.id) desc limit ?,?";
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        List<Article> list = queryRunner.query(sql, new BeanListHandler<>(Article.class), "%" + keywords + "%", (currentPage - 1) * pageSize, pageSize);
        for (Article article : list) {
            Article a = findAnswerById(article.getId(), user);
            aList.add(a);
        }
        return aList;
    }

    /**  
     * 根据UID查询用户点过赞的文章
     */
    @Override
    public List<Article> findAgreedArticle(User user, int uid, int currentPage, int pageSize)
            throws Exception {
        ArrayList<Article> list = new ArrayList<>();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select article.id from article join article_agree aa on aa.aid = article.id where aa.uid = ? limit ?,?";
        List<Map<String, Object>> list2 = queryRunner.query(sql, new MapListHandler(), uid,
                (currentPage - 1) * pageSize, pageSize);
        for (Map<String, Object> map : list2) {
            int aid = (int) map.get("id");
            Article a = findAnswerById(aid, user);
            if(a != null) {
                list.add(a);
            }
        }
        return list;
    }

    @Override
    public List<Article> findByUid(User user, int uid, int currentPage, int pageSize)
            throws Exception {
        List<Article> list = new ArrayList<>();
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select id from article where uid = ? limit ?, ?";
        List<Map<String, Object>> mapList = queryRunner.query(sql, new MapListHandler(), uid, (currentPage - 1) * pageSize, pageSize);
        
        for (Map<String, Object> map : mapList) {
            Article article = findAnswerById((int) map.get("id"), user);
            if(article != null) {
                list.add(article);
            }
        }
        return list;
    }
    
    /**  
     * 查询文章的作者id
     */
    @Override
    public int findAuthorByAid(int aid) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select uid from article where id = ?";
        return (int) queryRunner.query(sql, new ScalarHandler(), aid);
    }

    /**  
     * 根据id删除文章
     */
    @Override
    public void deleteByAid(int aid) throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
        //删除文章赞同--
        String sql = "delete from article_agree where aid = ?";
        queryRunner.update(sql, aid);
        
        //-删除文章
        sql = "delete from article where id = ?";
        queryRunner.update(sql, aid);
    }
}
