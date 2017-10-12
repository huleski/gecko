package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;

public interface ITopicDao extends IBaseDao<Topic> {

	Topic findTopicById(int id, User user) throws SQLException;

	List<Topic> findOthers(User user) throws SQLException;

	void cancleWatch(int tid, User user) throws SQLException;
	
	void addWatch(int tid, User user) throws SQLException;

	List<Topic> findWatchedTopic(int id) throws SQLException;
}
