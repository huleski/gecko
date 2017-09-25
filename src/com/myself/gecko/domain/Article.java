package com.myself.gecko.domain;

import java.util.Date;

public class Article {
	private Integer id;
	private User user;
	private Topic topic;
	private String titlePicture;
	private String title;

	private String pureContent;
	private String content;
	private Date date;
	private Integer commentCount;
	private Integer agreeCount;
	private Integer agree;

	public Integer getAgree() {
		return agree;
	}

	public Integer getAgreeCount() {
		return agreeCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public String getContent() {
		return content;
	}

	public Date getDate() {
		return date;
	}

	public Integer getId() {
		return id;
	}

	public String getPureContent() {
		return pureContent;
	}

	public String getTitle() {
		return title;
	}

	public String getTitlePicture() {
		return titlePicture;
	}

	public Topic getTopic() {
		return topic;
	}

	public User getUser() {
		return user;
	}

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

	public void setAgreeCount(Integer agreeCount) {
		this.agreeCount = agreeCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setPureContent(String pureContent) {
		this.pureContent = pureContent;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setTitlePicture(String titlePicture) {
		this.titlePicture = titlePicture;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
