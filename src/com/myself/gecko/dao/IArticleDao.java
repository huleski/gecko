package com.myself.gecko.dao;

import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.User;

public interface IArticleDao extends IBaseDao<Article>{

	void save(Article article) throws Exception;

	void disagree(User user, int cid) throws Exception;

	void agree(User user, int cid) throws Exception;
}
