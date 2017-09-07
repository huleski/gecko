package com.myself.gecko.domain;

import java.util.List;

/**
 * 分页查询的结果封装类
 * 
 * @param <E> 存入list集合中的类
 */
public class PageBean<E> {
	/**
	 * 返回页面的结果集合
	 */
	private List<E> list;
	/**
	 * 当前页码
	 */
	private int currentPage;
	/**
	 * 每页显示条数
	 */
	private int pageSize;
	/**
	 * 总页数
	 */
	private int totalPage;
	/**
	 * 总记录数[count(*)]
	 */
	private int count;

	
	public PageBean() {
	}

	public PageBean(List<E> list, int currentPage, int pageSize, int totalPage, int count) {
		this.list = list;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
		this.count = count;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
