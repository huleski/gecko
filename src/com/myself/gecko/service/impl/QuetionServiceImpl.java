package com.myself.gecko.service.impl;

import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.impl.QuestioinDaoImpl;
import com.myself.gecko.domain.Question;
import com.myself.gecko.service.IQuestioinService;

public class QuetionServiceImpl implements IQuestioinService {
	private IQuestionDao questionDao = new QuestioinDaoImpl();
	
	@Override
	public void save(Question question) throws Exception {
		questionDao.save(question);
	}

}
