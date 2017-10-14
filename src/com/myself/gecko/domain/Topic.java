package com.myself.gecko.domain;

import java.util.Date;

public class Topic {
	private Integer id;
	private String name;
	private String photo;
	private String description;
	private Date date;

	private Integer watchCount;
	private Integer watched;

	public Integer getWatched() {
		return watched;
	}

	public void setWatched(Integer watched) {
		this.watched = watched;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getWatchCount() {
		return watchCount;
	}

	public void setWatchCount(Integer watchCount) {
		this.watchCount = watchCount;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", name=" + name + ", photo=" + photo + ", description=" + description + ", date="
				+ date + ", watchCount=" + watchCount + "]";
	}
}
