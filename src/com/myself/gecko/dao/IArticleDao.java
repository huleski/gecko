package com.myself.gecko.dao;

import com.myself.gecko.domain.Article;

public interface IArticleDao extends IBaseDao<Article>{

	void save(Article article) throws Exception;

}
