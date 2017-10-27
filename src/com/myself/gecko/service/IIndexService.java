package com.myself.gecko.service;

import java.util.Set;

import com.myself.gecko.domain.User;

public interface IIndexService {

	Set getSet(User user, int currentPage) throws Exception;

}
