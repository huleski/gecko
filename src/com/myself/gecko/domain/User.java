package com.myself.gecko.domain;

public class User {
	private int id;
	private String name;
	private String password;
	private String phone;
	private String sex;

	private String sentence;
	private String address;
	private String industry;
	private String profession;
	private String education;

	private String description;
	private String photo;
	private String backphoto;
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", sex=" + sex
				+ ", sentence=" + sentence + ", address=" + address + ", industry=" + industry + ", profession="
				+ profession + ", education=" + education + ", description=" + description + ", photo=" + photo
				+ ", backphoto=" + backphoto + "]";
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getBackphoto() {
		return backphoto;
	}

	public void setBackphoto(String backphoto) {
		this.backphoto = backphoto;
	}

}
