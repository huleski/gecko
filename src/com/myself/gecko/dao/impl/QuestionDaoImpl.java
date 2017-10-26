package com.myself.gecko.dao.impl;

import java.sql.SQLException;
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

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class QuestionDaoImpl extends BaseDaoImpl<Question> implements IQuestionDao {

	@Override
	public void save(Question question) throws Exception {
		String sql = "insert into question values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, question.getUser().getId(), question.getTopic().getId(), question.getAnonymous(),
				question.getTitle(), question.getPureContent(), question.getContent(), question.getDate(), 0};
		CU(sql, params);
	}

	@Override
	public List<Question> ajaxQueryByUid(int currentPage, int pageSize, int uid) throws SQLException {
		String whereClause = "where uid = " + uid;
		return selectLimitByWhere(currentPage, pageSize, whereClause);
	}

	@Override
	public Question findQuestionById(int id, User user) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		//查询问题
		String sql = "select * from question where id = ?";
		Question question = queryRunner.query(sql, new BeanHandler<>(Question.class), id);
		
		//查询是否已经关注
		if(user != null) {
			int uid = user.getId();
			sql = "select count(*) from question_watch where uid = ? and qid = ?";
			Long count = (Long) queryRunner.query(sql, new ScalarHandler(), uid, id);
			question.setWatched(count.intValue());
		}
		
		//查询话题并封装
		sql = "select topic.id, topic.name from topic join question on question.tid = topic.id where question.id = ?";
		Map<String, Object> map = queryRunner.query(sql, new MapHandler(), id);
		Topic topic = new Topic();
		BeanUtils.populate(topic, map);
		question.setTopic(topic);
		
		//查询回答并封装
		sql = "select id from answer where qid = ?";
		List<Map<String, Object>> list = queryRunner.query(sql, new MapListHandler(), id);
		for (Map<String, Object> map2 : list) {
			question.getAnswerList().add(new Answer());
		}
		
		//查询关注数并封装
		sql = "select count(*) from question_watch where qid = ?";
		Long watchCount = (Long) queryRunner.query(sql, new ScalarHandler(), id);
		question.setWatchCount(watchCount.intValue());
		
		//查询评论并封装
		sql = "select id from comment where targetId = ? and type = ?";
		List<Map<String, Object>> list3 = queryRunner.query(sql, new MapListHandler(), id, Constant.COMMENT_TYPE_QUESTION);
		for (Map<String, Object> map4 : list3) {
			question.getCommentList().add(new Comment());
		}
		
		//查询提问者并封装
		sql = "select uid from question where id = ?";
		int uid = -1;
		List<Map<String, Object>> list4 = queryRunner.query(sql, new MapListHandler(), id);
		for (Map<String, Object> map4 : list4) {
			uid = (int) map4.get("uid");
		}
		sql = "select * from user where id = ?";
		User asker = queryRunner.query(sql, new BeanHandler<>(User.class), uid);
		question.setUser(asker);
		return question;
	}

	@Override
	public void addWatch(int qid, User user) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from question_watch where qid = ? and uid = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), qid, uid);
		if (count.intValue() == 0) {
			sql = "insert into question_watch values(null, ?, ?, ?)";
			queryRunner.update(sql, uid, qid, new Date());
		}
	}

	@Override
	public void cancleWatch(int qid, User user) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from question_watch where qid = ? and uid = ?";
		queryRunner.update(sql, qid, uid);
	}

	@Override
	public List<Question> findRelativeQuestion(int tid) throws Exception {
		String whereClause = "where tid = " + tid + " order by rand()";
		return this.selectLimitByWhere(1, Constant.RELATIVE_QUESTION_COUNT, whereClause );
	}

	@Override
	public void visitQuestion(int id) throws Exception {
		String sql = "update question set lookCount = lookCount + 1 where id = ?";
		Object[] params = {id};
		CU(sql, params);
	}

	@Override
	public List<Question> findLastWatchQuestionListByTid(int tid, int currentPage, int pageSize) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select distinct question.id, question.title from question left join question_watch on question.id = question_watch.qid where question.tid = ? order by question_watch.date desc limit ?, ?";
		return queryRunner.query(sql, new BeanListHandler<>(Question.class), tid, (currentPage - 1) * pageSize, pageSize);
		
		/*String sql = "select date from user_login where uid = ? order by date limit " + count + ", 1";
		Date date = (Date) queryRunner.query(sql, new ScalarHandler(), user.getId());
		System.out.println(date);
		
		//如果查到登录时间之前了
		sql = "select distinct question.id, question.title from question, question_watch where question.id = question_watch.qid and question.tid = ? and question_watch.date > ? order by question_watch.date desc limit ?, ?";
		return queryRunner.query(sql, new BeanListHandler<>(Question.class), tid, date, 0, Constant.TOPIC_DYNAIC_LOAD_COUNT);*/
	}

}
