package com.myself.gecko.domain;

import java.util.Date;

public class Answer {
	private Integer id;
	private User user;
	private User watcher;
	private Question question;
	private Topic topic;
	
	private Integer anonymous;
    private String pureContent;
    private String content;
    private Date date;
    private Integer commentCount;

    private Integer agreeCount;
	private Integer agree;
	private Integer mark = 1;
	
	public Integer getAgree() {
		return agree;
	}
	public Integer getAgreeCount() {
		return agreeCount;
	}
	
	public Integer getAnonymous() {
		return anonymous;
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

	public Integer getMark() {
		return mark;
	}

	public String getPureContent() {
		return pureContent;
	}

	public Question getQuestion() {
		return question;
	}

	public Topic getTopic() {
        return topic;
    }

	public User getUser() {
		return user;
	}

	public User getWatcher() {
        return watcher;
    }

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

	public void setAgreeCount(Integer agreeCount) {
		this.agreeCount = agreeCount;
	}

	public void setAnonymous(Integer anonymous) {
		this.anonymous = anonymous;
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

	public void setMark(Integer mark) {
        this.mark = mark;
    }

	public void setPureContent(String pureContent) {
		this.pureContent = pureContent;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public void setTopic(Topic topic) {
        this.topic = topic;
    }

	public void setUser(User user) {
		this.user = user;
	}

	public void setWatcher(User watcher) {
        this.watcher = watcher;
    }

	@Override
	public String toString() {
		return "Answer [id=" + id + ", user=" + user + ", question=" + question + ", anonymous=" + anonymous
			 + ", date=" + date + ", commentCount="
				+ commentCount + ", agreeCount=" + agreeCount + ", agree=" + agree + "]";
	}

}
