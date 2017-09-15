package com.myself.gecko.domain;

import java.util.Date;

public class Comment {
	private int id;
	private User user;
	private Comment comment;
	private Integer type;
	private Integer targetId;
	private String content;
	private Date date;
	
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", user=" + user + ", comment=" + comment + ", type=" + type + ", targetId="
				+ targetId + ", content=" + content + ", date=" + date + "]";
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

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTargetId() {
		return targetId;
	}

	public void setTargetId(Integer targetId) {
		this.targetId = targetId;
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

}
