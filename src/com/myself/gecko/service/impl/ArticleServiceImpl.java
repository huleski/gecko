package com.myself.gecko.service.impl;

import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.dao.impl.ArticleDaoImpl;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.User;
import com.myself.gecko.service.IArticleServive;

public class ArticleServiceImpl implements IArticleServive {
	IArticleDao articleDao = new ArticleDaoImpl();
	
	@Override
	public void save(Article article) throws Exception {
		articleDao.save(article);
	}

	@Override
	public Article findById(int aid, User user) throws Exception {
	    Article article = articleDao.findById(aid);
	    articleDao.improveArticleInfo(article, user);
		return article;
	}

	@Override
	public void disagree(User user, int aid) throws Exception {
		articleDao.disagree(user, aid);
	}

	@Override
	public void agree(User user, int aid) throws Exception {
		articleDao.agree(user, aid);
	}

}
