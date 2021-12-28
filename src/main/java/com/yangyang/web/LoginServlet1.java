package com.yangyang.web;


import com.yangyang.pojo.AdminDO;
import com.yangyang.service.AdminService;
import com.yangyang.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "loginServlet1",urlPatterns = "/login-servlet1")
public class LoginServlet1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String type=request.getParameter("type");
        if("trueLogin".equals(type)){
            String userName = request.getParameter("userName");
            String pwd = request.getParameter("password");
            if(userName==null||"".equals(userName.trim())||pwd==null||"".equals(pwd.trim())){
                request.setAttribute("message","用户名或密码不能为空");
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
                return;
            }
            AdminService adminService=new AdminServiceImpl();
            AdminDO adminDO = adminService.validateLogin(userName);
            if(adminDO!=null && pwd.equals(adminDO.getPassword())){
                adminDO.setPassword(null);
                request.getSession().setAttribute("admin",adminDO);
                response.sendRedirect(request.getContextPath()+"/studentServlet?type=toStudentManage");
            }
            else {
                request.setAttribute("message","用户名或密码不正确");
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
            }
        }
        else{
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request,response);
        }
    }
}
