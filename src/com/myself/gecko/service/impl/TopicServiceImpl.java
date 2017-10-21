package com.myself.gecko.service.impl;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.myself.gecko.constant.Constant;
import com.myself.gecko.dao.IAnswerDao;
import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.IQuestionDao;
import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.AnswerDaoImpl;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.dao.impl.QuestionDaoImpl;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.util.JsonUtil;

public class TopicServiceImpl implements ITopicService {
	private static TopicServiceImpl topicService;
	private ITopicDao topicDao = TopicDaoImpl.getTopicDao();
	private IUserDao userDao = UserDaoImpl.getUserDao();
	private IQuestionDao questionDao = new QuestionDaoImpl();
	private IAnswerDao answerDao = new AnswerDaoImpl();
	private IArticleDao articleDao = new ArticleDaoImpl();

	private TopicServiceImpl() {
	}

	public static TopicServiceImpl getTopicService() {
		if (topicService == null) {
			topicService = new TopicServiceImpl();
		}
		return topicService;
	}

	@Override
	public void add(Topic topic) throws SQLException {

	}

	@Override
	public void delete(int id) throws SQLException {

	}

	@Override
	public void update(Topic topic) throws SQLException {

	}

	@Override
	public Topic findTopicById(int id, User user) throws SQLException {
		return topicDao.findTopicById(id, user);
	}

	@Override
	public List<Topic> findAll() throws SQLException {
		return topicDao.findAll();
	}

	@Override
	public String findOthers(User user) throws SQLException {
		List<Topic> list = topicDao.findOthers(user);
		return JsonUtil.list2json(list);
	}

	@Override
	public void cancleWatch(int tid, User user) throws SQLException {
		topicDao.cancleWatch(tid, user);
	}

	@Override
	public void addWatch(int tid, User user) throws SQLException {
		topicDao.addWatch(tid, user);
	}

	@Override
	public List<Topic> findWatchedTopic(int id) throws SQLException {
		return topicDao.findWatchedTopic(id);
	}

	@Override
	public Set findTopicDynamic(int tid, String orderStyle, User user, int currentPage) throws Exception {
		@SuppressWarnings("all") // 创建根据时间排序的TreeSet集合
		TreeSet set = new TreeSet<>(new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				try {
					Method method1 = o1.getClass().getMethod("getDate");
					Method method2 = o2.getClass().getMethod("getDate");
					Date d1 = (Date) method1.invoke(o1);
					Date d2 = (Date) method2.invoke(o2);
					int result = d1.compareTo(d2);
					return result == 0 ? 1 : result;
				} catch (Exception e) {
					e.printStackTrace();
					return 0;
				}
			}
		});

		List<Question> qList = questionDao.findLastWatchQuestionListByTid(tid, currentPage, Constant.TOPIC_DYNAIC_LOAD_ANSWER_COUNT);
		List<Article> aList = articleDao.findArticleByOrderStyle(tid, user, orderStyle, currentPage, Constant.TOPIC_DYNAIC_LOAD_ARTICLE_COUNT);

		for (Question question : qList) {
			Answer answer = answerDao.findAnswerByOrderStyle(question.getId(), user, orderStyle);
			if (answer != null) { // 已有回答
				answer.setQuestion(question);
				set.add(answer);
			} else { // 还没有回答
				Question q = questionDao.findQuestionById(question.getId(), user);
				set.add(q);
			}
		}
		set.addAll(aList);
		return set;
	}

	@Override
	public Topic findById(int id) throws SQLException {
		return topicDao.findById(id);
	}
}
