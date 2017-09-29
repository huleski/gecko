package com.myself.gecko.domain;

import java.util.Date;

public class CommentVO {

	private Integer id;
	private Integer pid;
	private String content;
	private Integer agreeCount;
	private Date date;
	
	private Integer uid;
	private String name;
	private String photo;
	private Integer parentUid;
	private String parentName;
	
	private Integer agree;
	
	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", pid=" + pid + ", content=" + content + ", agreeCount=" + agreeCount
				+ ", date=" + date + ", uid=" + uid + ", name=" + name + ", photo=" + photo + ", parentUid=" + parentUid
				+ ", parentName=" + parentName + ", agree=" + agree + "]";
	}

	public Integer getAgree() {
		return agree;
	}

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
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
