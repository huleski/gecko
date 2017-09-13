package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.QuestionWatch;

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

}
