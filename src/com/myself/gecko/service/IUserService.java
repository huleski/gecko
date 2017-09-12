package com.myself.gecko.service;

import java.sql.SQLException;

import com.myself.gecko.domain.User;

public interface IUserService {
	public abstract void add(User user) throws SQLException;
	public abstract void delete(int id) throws SQLException;
	public abstract void update(User user) throws SQLException;
	public abstract User findById(int id) throws SQLException;
	public abstract User findUserByNameAndPwd(String name, String password) throws SQLException;
	public abstract void register(User user) throws SQLException;
}
