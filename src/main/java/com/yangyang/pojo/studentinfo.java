package com.yangyang.pojo;

public class studentinfo {
    private String studentId;
    private String studentName;
    private String classId;
    private String college;
    private String studentType;
    private String experience;
    private String hobby1;
    private String hobby2;
    private String hobby3;

    public studentinfo() {
    }

    public studentinfo(String studentId, String studentName, String classId, String college, String studentType, String experience, String hobby1, String hobby2, String hobby3) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.classId = classId;
        this.college = college;
        this.studentType = studentType;
        this.experience = experience;
        this.hobby1 = hobby1;
        this.hobby2 = hobby2;
        this.hobby3 = hobby3;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getStudentType() {
        return studentType;
    }

    public void setStudentType(String studentType) {
        this.studentType = studentType;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getHobby1() {
        return hobby1;
    }

    public void setHobby1(String hobby1) {
        this.hobby1 = hobby1;
    }

    public String getHobby2() {
        return hobby2;
    }

    public void setHobby2(String hobby2) {
        this.hobby2 = hobby2;
    }

    public String getHobby3() {
        return hobby3;
    }

    public void setHobby3(String hobby3) {
        this.hobby3 = hobby3;
    }

    @Override
    public String toString() {
        return "studentinfo{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", classId='" + classId + '\'' +
                ", college='" + college + '\'' +
                ", studentType='" + studentType + '\'' +
                ", experience='" + experience + '\'' +
                ", hobby1='" + hobby1 + '\'' +
                ", hobby2='" + hobby2 + '\'' +
                ", hobby3='" + hobby3 + '\'' +
                '}';
    }
}
