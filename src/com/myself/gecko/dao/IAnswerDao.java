package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.User;

public interface IAnswerDao extends IBaseDao<Answer> {
	List<Answer> findListByQid(int qid) throws Exception;

	List<Answer> ajaxLoad(int currentPage, int qid, User user) throws Exception;

	void save(Answer answer) throws Exception;

	void agree(User user, int aid) throws Exception;
	
	void disagree(User user, int aid) throws Exception;

	Answer findAnswerByOrderStyle(int qid, User user, String orderStyle) throws Exception;

    Answer findNewestAnswer(int id) throws Exception;

    List<Answer> findNewestAnswerInWatchedQuestion(User user, int currentPage, int pageSize) throws Exception;

    List<Answer> findAnswersByUserWatch(User user, int currentPage, int pageSize) throws Exception;

    List<Answer> findNewestAnswers(int currentPage, int pageSize) throws Exception;

    List<Answer> findHotday(User user, int currentPage, int pageSize) throws Exception;

    List<Answer> findHotmonth(User user, int currentPage, int pageSize) throws Exception;
}
