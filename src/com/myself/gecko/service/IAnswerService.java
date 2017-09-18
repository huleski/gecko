package com.myself.gecko.service;

import com.myself.gecko.domain.Answer;

public interface IAnswerService {

	String ajaxLoad(int currentPage, int qid) throws Exception;

	void save(Answer answer) throws Exception;

}
