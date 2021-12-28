package com.yangyang.service;


import com.yangyang.pojo.StudentDO;
import com.yangyang.pojo.StudentRequest;
import com.yangyang.pojo.StudentVO;
import com.yangyang.pojo.TableResult;

public interface StudentService {
    boolean addStudent(StudentDO studentDO);

    public TableResult<StudentVO> queryStudentByPage(StudentRequest studentRequest);

    StudentVO getStudentById(String studentId);

    boolean updateStudent(StudentDO studentDO);

    boolean deleteStudentById(String studentId);
}
