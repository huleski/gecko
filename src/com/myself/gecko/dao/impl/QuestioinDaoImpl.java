package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.util.C3P0Utils;

public class QuestioinDaoImpl extends BaseDao<Question> implements IQuestionDao {

	@Override
	public void save(Question question) throws Exception {
		String sql = "insert into question values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, question.getUser().getId(), question.getTopic().getId(), question.getAnonymous(),
				question.getTitle(), question.getPureContent(), question.getContent(), question.getDate(), null, null};
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
		String sql = "select * from question join topic on topic.id = question.tid where question.id = ?";
		Map<String, Object> map = queryRunner.query(sql, new MapHandler(), id);
		Question question = new Question();
		Topic topic = new Topic();
		
		BeanUtils.populate(topic, map);
		BeanUtils.populate(question, map);
		
		question.setTopic(topic);
		return question;
	}

}
