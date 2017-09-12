package com.myself.gecko.dao.impl;

import com.myself.gecko.dao.ITopicDao;
import com.myself.gecko.domain.Topic;

public class TopicDaoImpl extends BaseDao<Topic> implements ITopicDao {
	private static TopicDaoImpl topicDao;

	private TopicDaoImpl() {}

	public static TopicDaoImpl getTopicDao() {
		if (topicDao == null) {
			topicDao = new TopicDaoImpl();
		}
		return topicDao;
	}


}
