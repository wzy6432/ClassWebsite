package com.yangyang.web;

import com.yangyang.pojo.Student;
import com.yangyang.service.UserService;
import com.yangyang.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;
import com.yangyang.utils.WebUtils;



public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();


    protected void ajaxExistsStudentId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取请求的参数studentId
        String studentId = req.getParameter("studentId");
        // 调用userService.existsstudentId();
        boolean existsstudentId = userService.existsstudentId(studentId);
        // 把返回的结果封装成为map对象
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("existsUsername",existsstudentId);

        Gson gson = new Gson();
        String json = gson.toJson(resultMap);

        resp.getWriter().write(json);
    }

    /**
     * 注销
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        1、销毁Session中用户登录的信息（或者销毁Session）
        req.getSession().invalidate();
//        2、重定向到首页（或登录页面）。
        resp.sendRedirect(req.getContextPath());
    }
    /**
     * 处理登录的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //  1、获取请求的参数
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");
        // 调用 userService.login()登录处理业务
        Student loginUser = userService.login(new Student(studentId,password));
        // 如果等于null,说明登录 失败!
        if (loginUser == null) {
            // 把错误信息，和回显的表单项信息，保存到Request域中
            req.setAttribute("msg", "用户或密码错误！");
            req.setAttribute("studentId", studentId);
            //   跳回登录页面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            // 登录 成功
            // 保存用户登录的信息到Session域中
            req.getSession().setAttribute("user", loginUser);
            //跳到成功页面login_success.html
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }

    }

    /**
     * 处理注册的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // 获取Session中的验证码
//        String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
//        // 删除 Session中的验证码
//        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        //  1、获取请求的参数
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");

        Student student = WebUtils.copyParamToBean(req.getParameterMap(), new Student());

//        2、检查 验证码是否正确  === 写死,要求验证码为:abcde
//        if (token!=null && token.equalsIgnoreCase(code)) {
//        3、检查 用户名是否可用
            if (userService.existsstudentId(studentId)) {
                System.out.println("用户名[" + studentId + "]已存在!");

                // 把回显信息，保存到Request域中
                req.setAttribute("msg", "用户名已存在！！");
                req.setAttribute("studentId", studentId);


//        跳回注册页面
                req.getRequestDispatcher("/pages/user/contact.html").forward(req, resp);
            } else {
                //      可用
//                调用Sservice保存到数据库
                userService.register(new Student(studentId,password));
//
//        跳到注册成功页面 regist_success.jsp
                req.getRequestDispatcher("/pages/user/index.html").forward(req, resp);
            }
//        } else {
//            // 把回显信息，保存到Request域中
//            req.setAttribute("msg", "验证码错误！！");
//            req.setAttribute("username", username);
//            req.setAttribute("email", email);
//
//            System.out.println("验证码[" + code + "]错误");
//            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
//        }

    }


}
