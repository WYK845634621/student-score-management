package com.yikai.crud.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class Student {
	private Integer studentId;

	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,4})$", message = "学生姓名必须是6-16位或者2-4中文")
	private String studentName;

	private String gender;

	 @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$")
	// message="邮箱格式不正确")
	private String email;

	private String grade;

	private Integer mId;

	private String clas;

	// 查询学生时显示专业
	private Major major;

	public Student() {
		super();
	}

	
	
	public Student(Integer studentId, String studentName, String gender, String email, String grade, Integer mId,
			String clas) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.gender = gender;
		this.email = email;
		this.grade = grade;
		this.mId = mId;
		this.clas = clas;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName == null ? null : studentName.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade == null ? null : grade.trim();
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

	public String getClas() {
		return clas;
	}

	public void setClas(String clas) {
		this.clas = clas == null ? null : clas.trim();
	}

	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + ", gender=" + gender + ", email="
				+ email + ", grade=" + grade + ", mId=" + mId + ", clas=" + clas + ", major=" + major + "]";
	}

}