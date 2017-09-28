package com.myself.gecko.dao.impl;

import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.domain.Article;

public class ArticleDaoImpl extends BaseDao<Article> implements IArticleDao {

	@Override
	public void save(Article article) throws Exception {
		String sql = "insert into article values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, article.getUser().getId(), article.getTopic().getId(), 
				article.getTitlePicture(), article.getTitle(), article.getPureContent(),
				article.getContent(), article.getDate(), article.getCommentCount(), article.getAgreeCount()};
		CU(sql, params);
	}

}
