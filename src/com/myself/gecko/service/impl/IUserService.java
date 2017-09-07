package com.myself.gecko.service.impl;

import com.myself.gecko.domain.User;

public interface IUserService {
	public abstract void add(User user);
	public abstract void delete(int id);
	public abstract void update(User user);
	public abstract void findById(int id);
}
