package com.myself.gecko.service.impl;

import java.util.List;

import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.util.JsonUtil;


public class AnswerServiceImpl implements IAnswerService {
	private static IAnswerDao answerDao = new AnswerDaoImpl();
	
	@Override
	public List<Answer> ajaxLoad(int currentPage, int qid) throws Exception {
		return answerDao.ajaxLoad(currentPage, qid);
	}

	@Override
	public void save(Answer answer) throws Exception {
		answerDao.save(answer);
	}

}
