package com.myself.gecko.dao;

import java.sql.SQLException;
import java.util.List;

public interface IBaseDao<E> {
	/**
	 * 	 增改操作
	 * @param sql 要执行的SQL语句
	 * @param params SQL语句参数
	 * @throws SQLException
	 */
	public void CU(String sql, Object[] params) throws SQLException;
	
	/**
	 * 根据id删除数据
	 * @param id
	 * @throws SQLException
	 */
	public void deleteById(int id) throws SQLException;


	/**
	 * 根据id查找对象
	 * @param id	对象id
	 * @return		所需对象
	 * @throws SQLException 
	 */
	public E findById(int id) throws SQLException;

	/**
	 * 查找所有对象
	 * @return	返回包含所有对象的list
	 * @throws SQLException 
	 */
	public List<E> findAll() throws SQLException;

	
	/**
	 * @return 数据总条数
	 * @throws SQLException
	 */
	public int selectCount() throws SQLException;
	
	/**
	 * 分页查询
	 * @param currentPage	当前页码
	 * @param pageSize		页面大小(每页显示结果条数)
	 * @return				pageBean
	 * @throws SQLException 
	 */
	public List<E> selectLimit(int currentPage, int pageSize) throws SQLException;
}
