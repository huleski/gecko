package com.myself.gecko.service.impl;

import java.util.List;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IQuestionService;
import com.myself.gecko.util.JsonUtil;

public class QuestionServiceImpl implements IQuestionService {
	private IQuestionDao questionDao = new QuestionDaoImpl();
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
	public Question findQuestioinById(int id, User user) throws Exception {
		return questionDao.findQuestionById(id, user);
	}

	@Override
	public void addWatch(int qid, User user) throws Exception {
		questionDao.addWatch(qid, user);
	}

	@Override
	public void cancleWatch(int qid, User user) throws Exception {
		questionDao.cancleWatch(qid, user);
	}

}
