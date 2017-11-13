package com.myself.gecko.service;

import java.util.List;
import java.util.Set;

import com.myself.gecko.domain.Question;
import com.myself.gecko.domain.User;

public interface IIndexService {

	Set getSet(User user, int currentPage) throws Exception;

    List<Question> findNewestQuestion(int currentPage, int pageSize) throws Exception;

    List search(String keywords, int currentPage, User user) throws Exception;
}
