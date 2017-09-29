package com.myself.gecko.dao.impl;

import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.IArticleDao;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.User;
import com.myself.gecko.util.C3P0Utils;

public class ArticleDaoImpl extends BaseDao<Article> implements IArticleDao {

	@Override
	public void save(Article article) throws Exception {
		String sql = "insert into article values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] params = {null, article.getUser().getId(), article.getTopic().getId(), 
				article.getTitlePicture(), article.getTitle(), article.getPureContent(),
				article.getContent(), article.getDate(), article.getCommentCount(), article.getAgreeCount()};
		CU(sql, params);
	}
	
	@Override
	public void agree(User user, int cid) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from article_agree where cid = ? and uid = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler(), cid, uid);
		if(count.intValue() == 0) {
			sql = "insert into article_agree values(null, ?, ?, ?)";
			queryRunner.update(sql, cid, uid, new Date());
		}
	}

	@Override
	public void disagree(User user, int cid) throws Exception {
		int uid = user.getId();
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from article_agree where cid = ? and uid = ?";
		queryRunner.update(sql, cid, uid);
	}
}
