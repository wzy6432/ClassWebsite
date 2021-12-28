package com.yangyang.service.impl;

import com.yangyang.dao.UserDao;
import com.yangyang.dao.impl.UserDaoImpl;
import com.yangyang.pojo.Student;
import com.yangyang.service.UserService;

public class UserServiceImpl implements UserService {
    //下面的注册登录等业务是需要操作数据库的，而操作数据库的是Dao对象，所以要先创建Dao对象
    private UserDao userDao=new UserDaoImpl();
    //alt+insert实现接口的全部方法

    @Override
    public void register(Student student) {
        userDao.saveStudent(student);
    }

    @Override
    public Student login(Student student) {
        return userDao.queryUserByStudentIdAndPassword(student.getStudentId(),student.getPassword());
    }



    @Override
    public boolean existsstudentId(String studentId) {
        if(userDao.queryStudentByStudentId(studentId)==null)
        {return false;}//等于null说明没查到，没查到表示可用
        return true;
    }
}
