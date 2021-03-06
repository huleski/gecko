package com.myself.gecko.constant;

/**
 * 常量类
 */
public interface Constant {
	
	
	/**
	 * 查询话题相关问题
	 */
	public static final int RELATIVE_QUESTION_COUNT = 5;
	
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

	/**
	 * 话题动态加载回答数
	 */
	public static final int TOPIC_DYNAIC_LOAD_ANSWER_COUNT = 3;
	/**
	 * 话题动态加载文章数
	 */
	public static final int TOPIC_DYNAIC_LOAD_ARTICLE_COUNT = 3;

    /**  
     * 首页加载新增问题数
     */
    public static final int INDEX_NEW_QUESTION = 1;
    /**  
     * 首页加载新增问题回答数
     */
    public static final int INDEX_NEW_ANSWER = 1;
    /**  
     * 首页加载关注用户的新增问题回答数
     */
    public static final int WATCHEDUSER_ANSWER_COUNT = 2;
    /**  
     * 首页加载关注用户的新增文章数
     */
    public static final int WATCHEDUSER_ARTICLE_COUNT = 2;
    /**  
     * 首页加载关注用户的新增话题关注数
     */
    public static final int WATCHEDUSER_TOPIC_WATCH_COUNT = 2;
    /**  
     * 首页加载关注用户的新增问题关注数
     */
    public static final int WATCHEDUSER_QUESTION_WATCH_COUNT = 2;

    /**
     *  发现中加载答案数
     */
    public static final int FIND_ANSWER_COUNT = 2;

    /**  
     * 搜索回答数
     */
    public static final int SEARCH_ANSWER_COUNT = 2;
    
    /**  
     * 搜索文章数
     */
    public static final int SEARCH_ARTICLE_COUNT = 2;

    public static final int HOME_DYNAMIC_WATCH_COUNT = 2;

    public static final int HOME_ANSWER_COUNT = 2;

    public static final int HOME_ARTICLE_COUNT = 2;
}