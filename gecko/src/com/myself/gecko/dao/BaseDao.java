package com.myself.gecko.dao;

import java.util.List;

import com.myself.gecko.domain.PageBean;

public class BaseDao<E> {
	/**
	 * 增
	 * @param object 要保存的对象
	 */
	public void save(E object) {

	}

	/**
	 * 根据id删除
	 * @param id	需要删除的对象id
	 */
	public void delete(int id) {

	}

	/**
	 * 更新对象
	 * @param object	需要跟新的对象id
	 */
	public void update(E object) {

	}

	/**
	 * 根据id查找对象
	 * @param id	对象id
	 * @return		所需对象
	 */
	public E findById(int id) {
		return null;
	}

	/**
	 * 查找所有对象
	 * @return	返回包含所有对象的list
	 */
	public List<E> findAll() {
		return null;
	}

	/**
	 * 分页查询
	 * @param currentPage	当前页码
	 * @param pageSize		页面大小(每页显示结果条数)
	 * @return				pageBean
	 */
	public PageBean<E> pageQuery(int currentPage, int pageSize) {
		return null;
	}
}
