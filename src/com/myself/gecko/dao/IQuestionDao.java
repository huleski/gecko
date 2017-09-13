package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Question;

public interface IQuestionDao extends IBaseDao<Question> {

	void save(Question question) throws Exception;
	
	List<Question> ajaxQueryByUid(int currentPage, int pageSize, int uid) throws SQLException;

}
