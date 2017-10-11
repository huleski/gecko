package com.myself.gecko.dao;

import java.sql.SQLException;

import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.User;

public interface IUserDao extends IBaseDao<User> {
	/**
	 * 用户关注
	 * @param userId 		用户id
	 * @param watchedId		被关注用户的id
	 */
	public abstract void updateUserWatch(int userId, int watchedId);
	/**
	 * 话题关注
	 * @param userId	用户id
	 * @param topicId	被关注话题id
	 */
	public abstract void updateTopicWatch(int userId, int topicId);
	/**
	 * 问题关注
	 * @param userId		用户id
	 * @param QuestionId	被关注问题id
	 */
	public abstract void updateQuestionWatch(int userId, int QuestionId);
	public abstract User findUserByNameAndPwd(String name, String password) throws SQLException;
	public abstract void save(User user) throws SQLException;
	public abstract void update(User user) throws SQLException;
	public abstract void recordLogin(User user) throws SQLException;
	public abstract void cancleWatch(int uid, User user) throws SQLException;
	public abstract void addWatch(int uid, User user) throws SQLException;
	public abstract User findPersonById(int id, User user) throws SQLException;
	public abstract PersonInfo findPersonInfo(int id) throws SQLException;
	public abstract void visitHome(int id) throws SQLException;
}
