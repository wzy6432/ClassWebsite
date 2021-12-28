package com.yangyang.web;

import com.yangyang.pojo.Student;
import com.yangyang.service.UserService;
import com.yangyang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  1、获取请求的参数
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");
        // 调用 userService.login()登录处理业务
        Student loginStudent = userService.login(new Student(studentId,password));
        // 如果等于null,说明登录 失败!
        if (loginStudent == null) {
            // 把错误信息，和回显的表单项信息，保存到Request域中
            req.setAttribute("msg","用户或密码错误！");
            req.setAttribute("studentId", studentId);
            //   跳回登录页面
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            // 登录 成功
                        //创建session对象
            HttpSession session = req.getSession();
            //把用户数据保存在session域对象中
            session.setAttribute("studentId", studentId);
            //跳到成功页面login_success.html
            req.getRequestDispatcher("/user_class_homepage.jsp").forward(req, resp);
        }
    }
}
