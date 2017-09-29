package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;

public interface IQuestionDao extends IBaseDao<Question> {

	void save(Question question) throws Exception;
	
	List<Question> ajaxQueryByUid(int currentPage, int pageSize, int uid) throws SQLException;

	Question findQuestioinById(int id, User user) throws SQLException, Exception;

	void addWatch(int qid, User user) throws SQLException, Exception;
	
	void cancleWatch(int qid, User user) throws SQLException, Exception;

}
