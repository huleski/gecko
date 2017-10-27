package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;

public interface IQuestionDao extends IBaseDao<Question> {

	void save(Question question) throws Exception;
	
	List<Question> ajaxQueryByUid(int currentPage, int pageSize, int uid) throws SQLException;

	Question findQuestionById(int id, User user) throws Exception;

	void addWatch(int qid, User user) throws Exception;
	
	void cancleWatch(int qid, User user) throws Exception;

	List<Question> findRelativeQuestion(int tid) throws Exception;

	void visitQuestion(int id) throws Exception;

	List<Question> findLastWatchQuestionListByTid(int tid, int currentPage, int pageSize) throws Exception;

    List<Question> findNewestQuestion(int topicId, int currentPage, int pageSize) throws Exception;

    List<Question> findWatchedQuestion(int id) throws Exception;

    List<Question> findNewestQuestionInWatchedTopics(User user, int currentPage,
            int pageSize) throws Exception;

}
