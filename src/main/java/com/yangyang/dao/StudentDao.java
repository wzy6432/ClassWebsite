package com.yangyang.dao;

import com.yangyang.pojo.StudentDO;
import com.yangyang.pojo.StudentRequest;
import com.yangyang.pojo.TableResult;
import com.yangyang.pojo.StudentVO;

public interface StudentDao {
    int addStudent(StudentDO studentDO);

    TableResult<StudentVO> queryStudentByPage(StudentRequest studentRequest);

    StudentVO getStudentById(String studentId);

    int updateStudent(StudentDO studentDO);

    int deleteStudentById(String studentId);
}
