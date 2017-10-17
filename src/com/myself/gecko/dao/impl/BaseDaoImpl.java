package com.myself.gecko.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.myself.gecko.dao.IBaseDao;
import com.myself.gecko.domain.Answer;
import com.myself.gecko.domain.Article;
import com.myself.gecko.domain.Comment;
import com.myself.gecko.util.C3P0Utils;

@SuppressWarnings("all")
public class BaseDaoImpl<E> implements IBaseDao<E> {
	Class<E> clazz;
	String tableName;

	public BaseDaoImpl() {
		ParameterizedType paramType = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<E>) paramType.getActualTypeArguments()[0];
		tableName = clazz.getSimpleName().toLowerCase();
	}

	/**
	 * 增改操作
	 * 
	 * @param sql
	 *            要执行的SQL语句
	 * @param params
	 *            SQL语句参数
	 * @throws SQLException
	 */
	@Override
	public void CU(String sql, Object[] params) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		queryRunner.update(sql, params);
	}
	

	@Override
	public void deleteById(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from " + tableName + " where id = ?";
		queryRunner.update(sql, id);
	}

	/**
	 * 根据id查找对象
	 * 
	 * @param id
	 *            对象id
	 * @return 所需对象
	 * @throws SQLException
	 */
	@Override
	public E findById(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName + " where id = ?";
		return queryRunner.query(sql, new BeanHandler<>(clazz), id);
	}

	/**
	 * 查找所有对象
	 * 
	 * @return 返回包含所有对象的list
	 * @throws SQLException
	 */
	@Override
	public List<E> findAll() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName;
		return queryRunner.query(sql, new BeanListHandler<>(clazz));
	}

	@Override
	public int selectCount() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from " + tableName;
		Long count = (Long) queryRunner.query(sql, new ScalarHandler());
		return count.intValue();
	}

	/**
	 * 分页查询
	 * @param currentPage当前页码
	 * @param pageSize页面大小(每页显示结果条数)
	 * @return pageBean
	 */
	@Override
	public List<E> selectLimit(int currentPage, int pageSize) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName + " limit ?, ?";
		return queryRunner.query(sql, new BeanListHandler<>(clazz), (currentPage - 1) * pageSize, pageSize);
	}
	
	/**
	 * 分页查询
	 * @param currentPage当前页码
	 * @param pageSize页面大小(每页显示结果条数)
	 * @return pageBean
	 */
	@Override
	public List<E> selectLimitByWhere(int currentPage, int pageSize, String whereClause) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName + " " + whereClause + " limit ?, ?";
		return queryRunner.query(sql, new BeanListHandler<>(clazz), (currentPage - 1) * pageSize, pageSize);
	}
	
	public void isAgree(E e) throws Exception {
		String name = e.getClass().getSimpleName();
		if(name.equalsIgnoreCase("answer")) {
			Answer answer = (Answer) e;
			QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
			String sql = "select count(*) from answer_agree where uid = " + answer.getUser().getId() + " and aid = " + answer.getId();
			Long count = (Long) queryRunner.query(sql, new ScalarHandler());
			if(count != null && count == 1) {
				answer.setAgree(1);
			}
		} else if(name.equalsIgnoreCase("article")) {
			Article article = (Article) e;
			QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
			String sql = "select count(*) from article_agree where uid = " + article.getUser().getId() + " and aid = " + article.getId();
			Long count = (Long) queryRunner.query(sql, new ScalarHandler());
			if(count != null && count == 1) {
				article.setAgree(1);
			}
		} else if(name.equalsIgnoreCase("comment")) {
			Comment comment = (Comment) e;
			QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
			String sql = "select count(*) from comment_agree where uid = " + comment.getUser().getId() + " and cid = " + comment.getId();
			Long count = (Long) queryRunner.query(sql, new ScalarHandler());
			if(count != null && count == 1) {
				comment.setAgree(1);
			}
		}
	}
}
