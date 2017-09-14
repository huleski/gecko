package com.myself.gecko.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.TopicDaoImpl;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.ITopicService;
import com.myself.gecko.service.IUserService;

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
	public Topic findById(int id) throws SQLException {
		return null;
	}

	@Override
	public List<Topic> findAll() throws SQLException {
		return topicDao.findAll();
	}
	
}