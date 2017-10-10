package com.myself.gecko.service.impl;

import java.sql.SQLException;

import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.PersonInfo;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IUserService;

public class UserServiceImpl implements IUserService {
	private static UserServiceImpl userService;
	private IUserDao userDao = UserDaoImpl.getUserDao();
	
	private UserServiceImpl() {}
	
	public static UserServiceImpl getUserService() {
		if (userService == null) {
			userService = new UserServiceImpl();
		}
		return userService;
	}
	
	@Override
	public void add(User user) {

	}

	@Override
	public void delete(int id) {

	}

	@Override
	public void update(User user) throws SQLException {
		userDao.update(user);
	}

	@Override
	public User findPersonById(int id, User user) throws SQLException {
		return userDao.findPersonById(id, user);
	}
	@Override
	public User findUserByNameAndPwd(String name, String password) throws SQLException {
		User user = userDao.findUserByNameAndPwd(name, password);
		if(user != null) {
			userDao.recordLogin(user);
		}
		return user;
	}

	@Override
	public void register(User user) throws SQLException {
		userDao.save(user);
	}

	@Override
	public void cancleWatch(int uid, User user) throws SQLException {
		userDao.cancleWatch(uid, user);
	}

	@Override
	public void addWatch(int uid, User user) throws SQLException {
		userDao.addWatch(uid, user);
	}

	@Override
	public PersonInfo findPersonInfo(int id) throws SQLException {
		return userDao.findPersonInfo(id);
	}

}
