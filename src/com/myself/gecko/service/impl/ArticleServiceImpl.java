package com.myself.gecko.service.impl;

import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.domain.Article;
import com.myself.gecko.service.IArticleServive;

public class ArticleServiceImpl implements IArticleServive {
	IArticleDao articleDao = new ArticleDaoImpl();
	
	@Override
	public void save(Article article) throws Exception {
		articleDao.save(article);
	}

}
