package com.yangyang.service.impl;


import com.yangyang.dao.StudentDao;
import com.yangyang.dao.impl.StudentDaoImpl;
import com.yangyang.pojo.StudentDO;
import com.yangyang.pojo.StudentRequest;
import com.yangyang.pojo.StudentVO;
import com.yangyang.pojo.TableResult;
import com.yangyang.service.StudentService;

public class StudentServiceImpl implements StudentService {
    private StudentDao studentDao=new StudentDaoImpl();

    @Override
    public boolean addStudent(StudentDO studentDO) {
        return studentDao.addStudent(studentDO)==1;
    }

    public TableResult<StudentVO> queryStudentByPage(StudentRequest studentRequest) {
        return studentDao.queryStudentByPage(studentRequest);
    }

    @Override
    public StudentVO getStudentById(String studentId) {
        return studentDao.getStudentById(studentId);
    }

    @Override
    public boolean updateStudent(StudentDO studentDO) {
        return studentDao.updateStudent(studentDO)==1;
    }

    @Override
    public boolean deleteStudentById(String studentId) {
        return studentDao.deleteStudentById(studentId)==1;
    }
}
