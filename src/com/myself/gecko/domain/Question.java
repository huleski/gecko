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

	private List<Answer> answerList = new ArrayList<>();
	private List<QuestionWatch> watchList = new ArrayList<>();
	private List<Comment> commentList = new ArrayList<>();

	@Override
	public String toString() {
		return "Question [id=" + id + ", user=" + user + ", topic=" + topic + ", anonymous=" + anonymous + ", title="
				+ title + ", pureContent=" + pureContent + ", content=" + content + ", date=" + date + ", lookCount="
				+ lookCount + ", answerList=" + answerList + ", watchList=" + watchList + ", commentList=" + commentList
				+ "]";
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

	public List<Answer> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}

	public List<QuestionWatch> getWatchList() {
		return watchList;
	}

	public void setWatchList(List<QuestionWatch> watchList) {
		this.watchList = watchList;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

}
