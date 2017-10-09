package com.myself.gecko.dao.impl;

import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

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
		String sql = "insert into user(id, name, password, phone, photo, backphoto) values(?, ?, ?, ?, ?, ?)";
		Object[] params = {null, user.getName(), user.getPassword(), user.getPhone(), user.getPhoto(), user.getBackphoto()};
		CU(sql, params);
	}

	@Override
	public void update(User user) throws SQLException {
		String sql = "update user set sex=?, sentence=?, address=?, industry=?, profession=?, education=?, description=?, photo=?, backphoto=? where id = ?";
		Object[] params = {user.getSex(), user.getSentence(), user.getAddress(), user.getIndustry(), user.getProfession(), user.getEducation(), 
				user.getDescription(), user.getPhoto(), user.getBackphoto(), user.getId()};
		CU(sql, params);
	}

	@Override
	public void recordLogin(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into user_login values(?, ?, ?)";
		Object[] params = { null, user.getId(), new Date() };
		queryRunner.update(sql, params);
	}

	@Override
	public void cancleWatch(int uid, User user) throws SQLException {
		int watcherId = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from user_watch where hostId = ? and watcherId = ?";
		queryRunner.update(sql, uid, watcherId);
	}

	@Override
	public void addWatch(int uid, User user) throws SQLException {
		int watcherId = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from user_watch where hostId = ? and watcherId = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), uid, watcherId);
		if (count.intValue() == 0) {
			sql = "insert into user_watch values(null, ?, ?, ?)";
			queryRunner.update(sql, uid, watcherId, new Date());
		}
	}

	@Override
	public User findPersonById(int id, User user) throws SQLException {
		User person = findById(id);
		if(user != null && person != null) {
			int watcherId = user.getId();
			String sql = "select count(*) from user_watch where hostId = ? and watcherId = ?";
			QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
			Long count = (Long) queryRunner.query(sql, new ScalarHandler(), id, watcherId);
			person.setWatched(count.intValue());
		}
		return person;
	}

}
