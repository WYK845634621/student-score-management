package com.yikai.crud.bean;

public class Subject {
    private Integer subjectId;

    private Integer subjectScore;

    private Integer sId;

    private byte[] subjectName;

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getSubjectScore() {
        return subjectScore;
    }

    public void setSubjectScore(Integer subjectScore) {
        this.subjectScore = subjectScore;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public byte[] getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(byte[] subjectName) {
        this.subjectName = subjectName;
    }
}