package com.myself.gecko.service;

import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.User;

public interface IArticleServive {

	void save(Article article) throws Exception;

	Article findById(int aid, User user) throws Exception;

	void disagree(User user, int aid) throws Exception;

	void agree(User user, int aid) throws Exception;
}
