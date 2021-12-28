package com.yangyang.web;

import com.yangyang.pojo.studentinfo;
import com.yangyang.service.StudentInfoService;
import com.yangyang.service.impl.StudentInfoServiceImpl;
import com.yangyang.utils.WebUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
@WebServlet(name = "studentInfoServlet", value = "/studentInfo-servlet")
public class StudentInfoServlet extends BaseServlet{
    private StudentInfoService studentInfoService=new StudentInfoServiceImpl();

    /***
     * 根据学生学号查询学生个人信息
     *
 * @param req,resp
     * @return  void
     * @author: YangYang
     */

    protected void getStudentInfo(HttpServletRequest req, HttpServletResponse resp)throws SerialException, IOException{
        //1.获取请求的参数：学生学号
        String studentId=req.getParameter("studentId");
        //2.调用StudentInfoService.queryStudentInfoByStudentId来查询个人信息
        studentinfo studentinfo=studentInfoService.queryStudentInfoByStudentId(studentId);
        //3.保存个人信息到Request域中
        req.setAttribute("studentinfo",studentinfo);

    }
}












