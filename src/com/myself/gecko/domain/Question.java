package com.myself.gecko.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Question {
	private int id;
	private User user;
	private Topic topic;
	private Integer anonymous;
	private String title;

	private String pureContent;
	private String content;
	private Date date;
	private Integer lookCount;
	private Integer watchCount;
	
	private Integer watched;

	private List<Answer> answerList = new ArrayList<>();
	private List<Comment> commentList = new ArrayList<>();


	@Override
	public String toString() {
		return "Question [id=" + id + ", user=" + user + ", topic=" + topic + ", anonymous=" + anonymous + ", title="
				+ title + ", date=" + date + ", lookCount=" + lookCount + ", watchCount=" + watchCount + ", watched="
				+ watched + "]";
	}

	public Integer getWatched() {
		return watched;
	}

	public void setWatched(Integer watched) {
		this.watched = watched;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Integer getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(Integer anonymous) {
		this.anonymous = anonymous;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPureContent() {
		return pureContent;
	}

	public void setPureContent(String pureContent) {
		this.pureContent = pureContent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getLookCount() {
		return lookCount;
	}

	public void setLookCount(Integer lookCount) {
		this.lookCount = lookCount;
	}

	public Integer getWatchCount() {
		return watchCount;
	}

	public void setWatchCount(Integer watchCount) {
		this.watchCount = watchCount;
	}

	public List<Answer> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

}
