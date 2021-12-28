package com.yangyang.web;

import com.google.gson.Gson;
import com.yangyang.dao.StudentInfoDao;
import com.yangyang.pojo.Student;
import com.yangyang.pojo.studentinfo;
import com.yangyang.service.StudentInfoService;
import com.yangyang.service.impl.StudentInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ajaxServlet", value = "/ajax-servlet")

public class AjaxServlet extends BaseServlet {
    StudentInfoService studentInfoService=new StudentInfoServiceImpl();
    protected void jQueryAjax(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("jQueryAjax方法调用了");

        //String studentId=req.getParameter("studentId");
        //得到session对象
        HttpSession session = req.getSession(false);
        if(session==null){
            //没有登录成功，跳转到登录页面
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        //取出会话数据
        String studentId = (String)session.getAttribute("studentId");
        if(studentId==null){
            //没有登录成功，跳转到登录页面
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        System.out.println(studentId);
        if(studentId==null){
            System.out.println("请先登录");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
        else{
        studentinfo studentinfo= studentInfoService.queryStudentInfoByStudentId(studentId);
        System.out.println(studentinfo);
        Gson gson=new Gson();
        String studentinfoString=gson.toJson(studentinfo);
        System.out.println(studentinfoString);
        resp.getWriter().write(studentinfoString);
    }
    }}
