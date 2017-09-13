package com.myself.gecko.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.util.C3P0Utils;

public class AnswerDaoImpl extends BaseDao<Answer> implements IAnswerDao {

	@Override
	public List<Answer> findListByQid(int qid) throws Exception {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from answer where qid = ?";
		return queryRunner.query(sql, new BeanListHandler<>(Answer.class), qid);
	}

	
}
