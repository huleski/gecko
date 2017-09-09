package com.myself.gecko.service.impl;

import java.sql.SQLException;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.myself.gecko.dao.IUserDao;
import com.myself.gecko.dao.impl.UserDaoImpl;
import com.myself.gecko.domain.User;

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
	public void update(User user) {

	}

	@Override
	public User findById(int id) throws SQLException {
		return userDao.findById(id);
	}

	public User findUserByNameAndPwd(String name, String password) throws SQLException {
		return userDao.findUserByNameAndPwd(name, password);
	}

	@Override
	public void register(User user) throws SQLException {
		userDao.save(user);
	}

}
