package com.myself.gecko.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.myself.gecko.dao.IBaseDao;
import com.myself.gecko.util.C3P0Utils;

public class BaseDao<E> implements IBaseDao<E> {
	Class<E> clazz;
	String tableName;

	public BaseDao() {
		ParameterizedType paramType = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class<E>) paramType.getActualTypeArguments()[0];
		System.out.println(clazz);
		tableName = clazz.getSimpleName().toLowerCase();
		System.out.println(tableName);
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
	public void CU(String sql, Object[] params) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		queryRunner.update(sql, params);
	}

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
	public List<E> findAll() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName;
		return queryRunner.query(sql, new BeanListHandler<>(clazz));
	}

	public int selectCount() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from " + tableName;
		return (int) queryRunner.query(sql, new BeanHandler<>(clazz));
	}

	/**
	 * 分页查询
	 * 
	 * @param currentPage
	 *            当前页码
	 * @param pageSize
	 *            页面大小(每页显示结果条数)
	 * @return pageBean
	 * @throws SQLException
	 */
	public List<E> findByPage(int currentPage, int pageSize) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from " + tableName + " limit ?, ?";
		return queryRunner.query(sql, new BeanListHandler<>(clazz), (currentPage - 1) * pageSize, pageSize);
	}
}
