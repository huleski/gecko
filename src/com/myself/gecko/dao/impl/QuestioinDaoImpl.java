package com.myself.gecko.dao.impl;

import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.domain.Question;

public class QuestioinDaoImpl extends BaseDao<Question> implements IQuestionDao {

	@Override
	public void save(Question question) throws Exception {
		String sql = "insert into question values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, question.getUser().getId(), question.getTopic().getId(), question.getAnonymous(),
				question.getTitle(), question.getPureContent(), question.getContent(), question.getDate(), null, null};
		CU(sql, params);
	}	

}
