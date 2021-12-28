package com.yangyang.test;

import com.yangyang.pojo.Student;
import com.yangyang.service.UserService;
import com.yangyang.service.impl.UserServiceImpl;
import org.testng.annotations.Test;

import static org.junit.Assert.*;

public class UserServiceImplTest {
    UserService userService=new UserServiceImpl();
    @Test
    public void register() {
        userService.register(new Student("20190412310004","123456"));
    }

    @Test
    public void login() {
        System.out.println(userService.login(new Student("20190412310044","123456")));
    }

    @Test
    public void existsstudentId() {
        if(userService.existsstudentId("20190412310044")){
            System.out.println("该账号已存在");
        }else
        {
            System.out.println("该账号未注册");
        }
    }
}