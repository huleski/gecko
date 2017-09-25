package com.myself.gecko.domain;

import java.util.Date;

public class Comment {
	private Integer id;
	private User user;
	private Comment parent;
	private Integer type;
	private Integer targetId;
	
	private String content;
	private Date date;
	private Integer agreeCount;
	private Integer agree;

	@Override
	public String toString() {
		return "Comment [id=" + id + ", user=" + user + ", parent=" + parent + ", type=" + type + ", targetId="
				+ targetId + ", content=" + content + ", date=" + date + ", agreeCount=" + agreeCount + "]";
	}

	public Integer getAgree() {
		return agree;
	}

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

	public Integer getAgreeCount() {
		return agreeCount;
	}

	public void setAgreeCount(Integer agreeCount) {
		this.agreeCount = agreeCount;
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

	public Comment getParent() {
		return parent;
	}

	public void setParent(Comment parent) {
		this.parent = parent;
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
