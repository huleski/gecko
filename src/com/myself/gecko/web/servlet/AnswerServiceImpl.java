package com.myself.gecko.web.servlet;

import java.util.List;

import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.service.IAnswerService;
import com.myself.gecko.util.JsonUtil;


public class AnswerServiceImpl implements IAnswerService {
	private static IAnswerDao answerDao = new AnswerDaoImpl();
	
	@Override
	public String ajaxLoad(int currentPage, int qid) throws Exception {
		List<Answer> list = answerDao.ajaxLoad(currentPage, qid);
		return JsonUtil.list2json(list);
	}

}
