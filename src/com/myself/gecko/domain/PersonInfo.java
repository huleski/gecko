package com.myself.gecko.domain;

public class PersonInfo {

	/**
	 * 获得赞同
	 */
	private Integer approvaledCount;
	/**
	 * 关注了
	 */
	private Integer followedCount;
	/**
	 * 被关注
	 */
	private Integer watchedCount;

	/**
	 * 关注话题
	 */
	private Integer watchTopicCount;
	/**
	 * 关注问题
	 */
	private Integer watchQuestionCount;
	/**
	 * 关注专栏
	 */
	private Integer watchColumnCount;
	/**
	 * 关注收藏夹
	 */
	private Integer watchCollectionCount;
	
	public Integer getApprovaledCount() {
		return approvaledCount;
	}

	public Integer getFollowedCount() {
		return followedCount;
	}

	public Integer getWatchCollectionCount() {
		return watchCollectionCount;
	}

	public Integer getWatchColumnCount() {
		return watchColumnCount;
	}

	public Integer getWatchedCount() {
		return watchedCount;
	}

	public Integer getWatchQuestionCount() {
		return watchQuestionCount;
	}

	public Integer getWatchTopicCount() {
		return watchTopicCount;
	}

	public void setApprovaledCount(Integer approvaledCount) {
		this.approvaledCount = approvaledCount;
	}

	public void setFollowedCount(Integer followedCount) {
		this.followedCount = followedCount;
	}

	public void setWatchCollectionCount(Integer watchCollectionCount) {
		this.watchCollectionCount = watchCollectionCount;
	}

	public void setWatchColumnCount(Integer watchColumnCount) {
		this.watchColumnCount = watchColumnCount;
	}

	public void setWatchedCount(Integer watchedCount) {
		this.watchedCount = watchedCount;
	}

	public void setWatchQuestionCount(Integer watchQuestionCount) {
		this.watchQuestionCount = watchQuestionCount;
	}

	public void setWatchTopicCount(Integer watchTopicCount) {
		this.watchTopicCount = watchTopicCount;
	}

	@Override
	public String toString() {
		return "PersonInfo [approvaledCount=" + approvaledCount + ", followedCount=" + followedCount + ", watchedCount="
				+ watchedCount + ", watchTopicCount=" + watchTopicCount + ", watchQuestionCount=" + watchQuestionCount
				+ ", watchColumnCount=" + watchColumnCount + ", watchCollectionCount=" + watchCollectionCount + "]";
	}

}
