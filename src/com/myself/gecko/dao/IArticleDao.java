package com.myself.gecko.dao;

import java.util.List;

import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.User;

public interface IArticleDao extends IBaseDao<Article>{

	void save(Article article) throws Exception;

	void disagree(User user, int aid) throws Exception;

	void agree(User user, int aid) throws Exception;

	Article findAnswerById(int aid, User user) throws Exception;

	List<Article> findArticleByOrderStyle(int tid, User user, String orderStyle, int currentPage, int pageSize) throws Exception;

    List<Article> findArticlesByUserWatch(User user, int currentPage, int pageSize) throws Exception;

    List<Article> findNewestArticles(int currentPage, int pageSize) throws Exception;
}
