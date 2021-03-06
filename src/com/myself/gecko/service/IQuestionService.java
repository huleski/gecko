package com.myself.gecko.service;

import java.util.List;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;

public interface IQuestionService {

	void save(Question question) throws Exception ;

	Question findQuestioinById(int id, User user) throws Exception;

	void addWatch(int qid, User user) throws Exception;
	
	void cancleWatch(int qid, User user) throws Exception;

	String findRelativeQuestion(int tid) throws Exception;

	void visitQuestion(int id) throws Exception;

    List<Question> findAssociated(String keywords) throws Exception;

}
