package com.myself.gecko.domain;

import java.util.Date;

public class CommentVO {

	private int id;
	private Integer pid;
	private String content;
	private Integer agreeCount;
	private Date date;
	private int uid;
	private String name;
	private String photo;
	private Integer parentUid;
	private String parentName;

	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", pid=" + pid + ", content=" + content + ", agreeCount=" + agreeCount
				+ ", date=" + date + ", uid=" + uid + ", name=" + name + ", photo=" + photo + ", parentUid=" + parentUid
				+ ", parentName=" + parentName + "]";
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAgreeCount() {
		return agreeCount;
	}

	public void setAgreeCount(Integer agreeCount) {
		this.agreeCount = agreeCount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getParentUid() {
		return parentUid;
	}

	public void setParentUid(Integer parentUid) {
		this.parentUid = parentUid;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

}
