package com.myself.gecko.constant;

/**
 * 常量类
 */
public interface Constant {
	
	/**
	 * ajax自动加载问题数
	 */
	public static final int QUESTION_AJAX_LOAD_COUNT = 15;
	/**
	 * ajax自动加载回答数
	 */
	public static final int ANSWER_AJAX_LOAD_COUNT = 2;
	/**
	 * ajax自动加载评论数
	 */
	public static final int COMMENT_AJAX_LOAD_COUNT = 2;

	/**
	 * 评论类型:回答
	 */
	public static final int COMMENT_TYPE_ANSWER = 1;

	/**
	 * 评论类型:文章
	 */
	public static final int COMMENT_TYPE_ARTICLE = 2;
	/**
	 * 评论类型:问题
	 */
	public static final int COMMENT_TYPE_QUESTION = 3;
}
