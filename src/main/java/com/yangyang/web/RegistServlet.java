package com.yangyang.web;

import com.yangyang.pojo.Student;
import com.yangyang.service.UserService;
import com.yangyang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
@WebServlet(name = "registServlet", value = "/regist-servlet")
public class RegistServlet extends HttpServlet {
    private UserService userService=new UserServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        //1.获取请求的参数
        String studentId=req.getParameter("studentId");
        String password=req.getParameter("password");
        //2.检查该账号是否可用
        if(userService.existsstudentId(studentId)){
            System.out.println("该账号已注册！");
            //把回显信息，保存到Request域中
            req.setAttribute("msg","该学号已被注册！请登录！");
            //跳回注册页面
            req.getRequestDispatcher("/regist.jsp").forward(req,resp);
        }
        else{
            //可用
            //调用service保存到数据库
            userService.register(new Student(studentId,password));
            req.setAttribute("msg","注册成功!");
            //跳到注册成功页面,默认为填写个人信息页面
            req.getRequestDispatcher("/regist_success.jsp").forward(req,resp);
        }
    }
}














