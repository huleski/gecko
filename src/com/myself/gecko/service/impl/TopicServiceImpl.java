package com.myself.gecko.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.util.JsonUtil;

public class TopicServiceImpl implements ITopicService {
	private static TopicServiceImpl topicService;
	private ITopicDao topicDao = TopicDaoImpl.getTopicDao();
	
	private TopicServiceImpl() {}
	
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
	public String findOthers() throws SQLException {
		List<Topic> list = topicDao.findOthers();
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
	
}
