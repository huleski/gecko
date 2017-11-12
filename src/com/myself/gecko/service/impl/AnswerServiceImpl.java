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
import com.myself.gecko.service.IAnswerService;


public class AnswerServiceImpl implements IAnswerService {
	private static IAnswerDao answerDao = new AnswerDaoImpl();
	private static IQuestionDao questionDao = new QuestionDaoImpl();
	
	@Override
	public List<Answer> ajaxLoad(int currentPage, int qid, User user) throws Exception {
		return answerDao.ajaxLoad(currentPage, qid, user);
	}

	@Override
	public void save(Answer answer) throws Exception {
		answerDao.save(answer);
	}

	@Override
	public void agree(User user, int aid) throws Exception {
		answerDao.agree(user, aid);
	}

	@Override
	public void disagree(User user, int aid) throws Exception {
		answerDao.disagree(user, aid);
	}

    @Override
    public List<Answer> findHotday(int currentPage, User user) throws Exception {
        return answerDao.findHotday(user, currentPage, Constant.FIND_ANSWER_COUNT);
    }

    @Override
    public List<Answer> findHotmonth(int currentPage, User user) throws Exception {
        return answerDao.findHotmonth(user, currentPage, Constant.FIND_ANSWER_COUNT);
    }

    @Override
    public List<Answer> search(String keywords, int currentPage) throws Exception {
        List<Question> questions =  questionDao.search(keywords, currentPage, Constant.SEARCH_RESULT_COUNT);
        
        return null; 
    }

}
