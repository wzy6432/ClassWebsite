package com.yangyang.pojo;

public class ClassNoticeDo {
    String classId;
    String notice;

    public ClassNoticeDo() {
    }

    public ClassNoticeDo(String classId,  String notice) {
        this.classId = classId;

        this.notice = notice;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }



    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    @Override
    public String toString() {
        return "ClassNoticeDo{" +
                "classId='" + classId + '\'' +
                ", notice='" + notice + '\'' +
                '}';
    }
}
