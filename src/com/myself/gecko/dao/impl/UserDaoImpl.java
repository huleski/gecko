package com.myself.gecko.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class UserDaoImpl extends BaseDao<User> implements IUserDao {
	private static UserDaoImpl userDao;

	private UserDaoImpl() {}

	public static UserDaoImpl getUserDao() {
		if (userDao == null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}

	@Override
	public void updateUserWatch(int userId, int watchedId) {

	}

	@Override
	public void updateTopicWatch(int userId, int topicId) {

	}

	@Override
	public void updateQuestionWatch(int userId, int QuestionId) {

	}

	@Override
	public User findUserByNameAndPwd(String name, String password) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where name = ? and password = ?";
		return queryRunner.query(sql, new BeanHandler<>(User.class), name, password);
	}

	@Override
	public void save(User user) throws SQLException {
		String sql = "insert into user(id, name, password, phone) values(?, ?, ?, ?)";
		Object[] params = {null, user.getName(), user.getPassword(), user.getPhone()};
		CU(sql, params);
	}

	@Override
	public void update(User user) throws SQLException {
		String sql = "update user set sex=?, sentence=?, address=?, industry=?, profession=?, education=?, description=? where id = ?";
		Object[] params = {user.getSex(), user.getSentence(), user.getAddress(), user.getIndustry(), user.getProfession(), user.getEducation(), user.getDescription(), user.getId()};
		CU(sql, params);
	}


}
