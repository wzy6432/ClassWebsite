package com.yangyang.test;

import com.yangyang.dao.UserDao;
import com.yangyang.dao.impl.UserDaoImpl;
import com.yangyang.pojo.Student;
import org.junit.Test;
import static org.junit.Assert.*;

public class UserDaoImplTest {
    UserDao userDao=new UserDaoImpl();
    @Test
    public void queryStudentByStudentId() {
        if(userDao.queryStudentByStudentId("20190412310044")==null){
            System.out.println("该账号未注册！");
        }else{
            System.out.println("该账号已注册！");
        }
    }

    @Test
    public void queryUserByStudentIdAndPassword() {
        if(userDao.queryUserByStudentIdAndPassword("20190412310044","123456")==null){
            System.out.println("账号或者密码错误，请重新输入");
        }else{
            System.out.println("登录成功");
        }
    }

    @Test
    public void saveStudent() {
        System.out.println(userDao.saveStudent(new Student("20190412310001","123456")));
    }
}