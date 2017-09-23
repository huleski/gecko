package com.myself.gecko.service;

import java.util.List;

import com.myself.gecko.domain.Answer;

public interface IAnswerService {

	List<Answer> ajaxLoad(int currentPage, int qid) throws Exception;

	void save(Answer answer) throws Exception;

}
