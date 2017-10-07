package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Topic;

public interface ITopicDao extends IBaseDao<Topic> {

	Topic findTopicById(int id) throws SQLException;

	List<Topic> findOthers() throws SQLException;
}
