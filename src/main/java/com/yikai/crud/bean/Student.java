package com.yikai.crud.bean;

public class Student {
    private Integer studentId;

    private String studentName;

    private String gender;

    private String email;

    private String grade;

    private Integer mId;

    private String clas;
    
//    查询学生时显示专业
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
}