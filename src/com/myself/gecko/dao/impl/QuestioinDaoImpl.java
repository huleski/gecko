package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.QuestionWatch;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.util.C3P0Utils;

public class QuestioinDaoImpl extends BaseDao<Question> implements IQuestionDao {

	@Override
	public void save(Question question) throws Exception {
		String sql = "insert into question values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, question.getUser().getId(), question.getTopic().getId(), question.getAnonymous(),
				question.getTitle(), question.getPureContent(), question.getContent(), question.getDate(), null};
		CU(sql, params);
	}

	@Override
	public List<Question> ajaxQueryByUid(int currentPage, int pageSize, int uid) throws SQLException {
		String whereClause = "where uid = " + uid;
		return selectLimitByWhere(currentPage, pageSize, whereClause);
	}

	@Override
	public Question findQuestioinById(int id) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		//查询问题
		String sql = "select * from question where question.id = ?";
		Question question = queryRunner.query(sql, new BeanHandler<>(Question.class), id);
		
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
		
		//查询关注列表并封装
		sql = "select id from question_watch where qid = ?";
		List<Map<String, Object>> list2 = queryRunner.query(sql, new MapListHandler(), id);
		for (Map<String, Object> map3 : list2) {
			question.getWatchList().add(new QuestionWatch());
		}
		
		//查询评论并封装
		sql = "select id from comment where targetId = ? and type = ?";
		List<Map<String, Object>> list3 = queryRunner.query(sql, new MapListHandler(), id, Constant.COMMENT_TYPE_QUESTION);
		for (Map<String, Object> map4 : list3) {
			question.getCommentList().add(new Comment());
		}
		
		return question;
	}

}
