package com.yangyang.web;

import com.google.gson.Gson;
import com.yangyang.pojo.ClassNoticeDo;
import com.yangyang.service.ClasssNoticeService;
import com.yangyang.service.impl.ClassNoticeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name="noticeAjaxServlet",value = "/noticeAjax-Servlet")
public class NoticeAjaxServlet extends BaseServlet{
    ClasssNoticeService classsNoticeService=new ClassNoticeServiceImpl();
    protected void jQueryForClassNotice(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("jQueryForClassNotice方法调用了");
        //获取请求的参数:classId即公告标题
        String classId=req.getParameter("classId");
        ClassNoticeDo classNoticeDo=classsNoticeService.queryClassNoticeByClassId(classId);
        System.out.println(classNoticeDo);
        Gson gson=new Gson();
        String classNoticeDoString=gson.toJson(classNoticeDo);
        System.out.println(classNoticeDoString);
        resp.getWriter().write(classNoticeDoString);

    }
}













