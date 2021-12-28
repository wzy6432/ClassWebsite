package com.yangyang.dao.impl;

import com.yangyang.dao.UserDao;
import com.yangyang.pojo.Student;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public Student queryStudentByStudentId(String studentId) {
        String sql = "select `studentId`,`password` from student where studentId = ?";
        return queryForOne(Student.class, sql, studentId);
    }

    @Override
    public Student queryUserByStudentIdAndPassword(String studentId, String password) {
        String sql = "select `studentId`,`password` from student where studentId = ? and password = ?";
        return queryForOne(Student.class, sql, studentId,password);
    }

    @Override
    public int saveStudent(Student student) {
        String sql = "insert into student(`studentId`,`password`) values(?,?)";
        return update(sql, student.getStudentId(),student.getPassword());
    }
}
