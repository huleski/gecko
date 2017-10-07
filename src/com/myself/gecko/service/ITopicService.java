package com.myself.gecko.service;

import java.sql.SQLException;
import java.util.List;

import com.myself.gecko.domain.Topic;

public interface ITopicService {
	public abstract void add(Topic topic) throws SQLException;
	public abstract void delete(int id) throws SQLException;
	public abstract void update(Topic topic) throws SQLException;
	public abstract Topic findTopicById(int id) throws SQLException;
	public abstract List<Topic> findAll() throws SQLException;
	public abstract String findOthers() throws SQLException;
}
