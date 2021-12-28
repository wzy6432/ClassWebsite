package com.yangyang.web;

import com.yangyang.dao.StudentInfoDao;
import com.yangyang.pojo.studentinfo;
import com.yangyang.service.StudentInfoService;
import com.yangyang.service.UserService;
import com.yangyang.service.impl.StudentInfoServiceImpl;
import com.yangyang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "registSuccessServlet", value = "/registSuccess-servlet")
public class RegistSuccessServlet extends HttpServlet {
    private StudentInfoService studentInfoService=new StudentInfoServiceImpl();
    private UserService userService=new UserServiceImpl();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        //1.获取请求的参数
        String studentId=req.getParameter("studentId");
        String studentName=req.getParameter("studentName");
        String classId=req.getParameter("classId");
        String college=req.getParameter("college");
        String studentType=req.getParameter("studentType");
        String experience=req.getParameter("experience");
        String hobby1=req.getParameter("hobby1");
        String hobby2=req.getParameter("hobby2");
        String hobby3=req.getParameter("hobby3");

        //2.如果提交的学号不是数据库已有的，无法注册个人信息
        if(!userService.existsstudentId(studentId)){
            System.out.println("该账号未注册，请正确填写");
            //把回显消息保存到request域中
            req.setAttribute("msg","未找到该账号，请正确输入");
            //跳回注册成功页面
            req.getRequestDispatcher("/regist_success.jsp").forward(req,resp);
        }else{
            //该学号是已注册的，可以填写个人信息,调用service保存到数据库中
            studentInfoService.updateStudentInfo(new studentinfo(studentId,studentName,classId,college,studentType,experience,hobby1,hobby2,hobby3));
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }
    }
}














