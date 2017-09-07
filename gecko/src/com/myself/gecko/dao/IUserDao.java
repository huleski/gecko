package com.myself.gecko.dao;

public interface IUserDao {
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
}
