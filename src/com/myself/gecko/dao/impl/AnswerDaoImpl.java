package com.myself.gecko.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class AnswerDaoImpl extends BaseDao<Answer> implements IAnswerDao {

	@Override
	public List<Answer> findListByQid(int qid) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from answer where qid = ?";
		return queryRunner.query(sql, new BeanListHandler<>(Answer.class), qid);
	}

	@Override
	public List<Answer> ajaxLoad(int currentPage, int qid) throws Exception {
		String whereClause = "where qid = " + qid;
		List<Answer> list = selectLimitByWhere(currentPage, Constant.ANSWER_AJAX_LOAD_COUNT, whereClause );
		String sql = null;
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		for (Answer answer : list) {
			sql = "select user.id, user.name, user.sentence,user.photo from user join answer on answer.uid = user.id where answer.id = ?";
			Map<String, Object> map = queryRunner.query(sql, new MapHandler(), answer.getId());
			User user = new User();
			BeanUtils.populate(user, map);
			answer.setUser(user);
		}
		return list;
	}

	
}
