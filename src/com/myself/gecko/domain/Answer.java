package com.myself.gecko.domain;

import java.util.Date;

public class Answer {
	private Integer id;
	private User user;
	private Question question;
	private Integer anonymous;
	private String pureContent;

	private String content;
	private Date date;
	private Integer commentCount;
	private Integer agreeCount;
	private Integer agree;

	@Override
	public String toString() {
		return "Answer [id=" + id + ", user=" + user + ", question=" + question + ", anonymous=" + anonymous
			 + ", date=" + date + ", commentCount="
				+ commentCount + ", agreeCount=" + agreeCount + ", agree=" + agree + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Integer getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(Integer anonymous) {
		this.anonymous = anonymous;
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

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getAgreeCount() {
		return agreeCount;
	}

	public void setAgreeCount(Integer agreeCount) {
		this.agreeCount = agreeCount;
	}

	public Integer getAgree() {
		return agree;
	}

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

}
