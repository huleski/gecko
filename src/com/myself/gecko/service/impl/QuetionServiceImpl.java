package com.myself.gecko.service.impl;

import java.util.List;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.QuestioinDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.service.IQuestioinService;
import com.myself.gecko.util.JsonUtil;

public class QuetionServiceImpl implements IQuestioinService {
	private IQuestionDao questionDao = new QuestioinDaoImpl();
	private IAnswerDao answerDao = new AnswerDaoImpl();
	
	@Override
	public void save(Question question) throws Exception {
		questionDao.save(question);
	}

	@Override
	public String ajaxQueryByUid(int currentPage, int uid) throws Exception {
		List<Question> list = questionDao.ajaxQueryByUid(currentPage, Constant.QUESTION_AJAX_LOAD_COUNT, uid);
		for (Question question : list) {
			List<Answer> answerList = answerDao.findListByQid(question.getId());
			question.getAnswerList().addAll(answerList);
		}
		return JsonUtil.list2json(list);
	}

	@Override
	public Question findQuestioinById(int id) throws Exception {
		return questionDao.findQuestioinById(id);
	}

}
