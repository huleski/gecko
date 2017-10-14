package com.myself.gecko.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import com.myself.gecko.domain.Topic;
import com.myself.gecko.domain.User;

public interface ITopicService {
	public abstract void add(Topic topic) throws SQLException;
	public abstract void delete(int id) throws SQLException;
	public abstract void update(Topic topic) throws SQLException;
	public abstract Topic findTopicById(int id, User user) throws SQLException;
	public abstract Topic findById(int id) throws SQLException;
	public abstract List<Topic> findAll() throws SQLException;
	public abstract String findOthers(User user) throws SQLException;
	public abstract void cancleWatch(int tid, User user) throws SQLException;
	public abstract void addWatch(int tid, User user) throws SQLException;
	public abstract List<Topic> findWatchedTopic(int id) throws SQLException;
	/**
	 * @param tid 话题id
	 * @param orderStyle 排序方式(热度,即最近被关注的问题. 	时间)
	 * @param user	登录用户
	 * @param currentPage 当前页
	 */
	public abstract Set findTopicDynamic(int tid, String orderStyle, User user, int currentPage) throws Exception;
}
