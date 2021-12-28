package com.yangyang.web;

import com.yangyang.pojo.StudentDO;
import com.yangyang.pojo.StudentRequest;
import com.yangyang.pojo.StudentVO;
import com.yangyang.pojo.TableResult;
import com.yangyang.service.StudentService;
import com.yangyang.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "studentServlet",urlPatterns = "/studentServlet")
public class StudentServlet extends HttpServlet {
    private StudentService studentService=new StudentServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type=request.getParameter("type");
        if("toStudentManage".equals(type)){
            //查询出来的学生列表放到request中
            String name = request.getParameter("name");
            String pageNowStr = request.getParameter("pageNow");
            StudentRequest studentRequest=new StudentRequest();
            int pageNow=1;
            if(pageNowStr!=null&&!"".equals(pageNowStr.trim())){
                pageNow=Integer.parseInt(pageNowStr);
            }
            studentRequest.setPageNow(pageNow);
            studentRequest.setName(name);
            TableResult<StudentVO> tableResult=studentService.queryStudentByPage(studentRequest);
            tableResult.setPageNow(pageNow);
            tableResult.setName(name==null?"":name);
            //放到请求域中
            request.setAttribute("tableResult",tableResult);
            request.getRequestDispatcher("/WEB-INF/student/studentManage.jsp").forward(request,response);
        }
        else if("toAdd".equals(type)){
            request.getRequestDispatcher("/WEB-INF/student/add.jsp").forward(request,response);
        }
        else if("add".equals(type)){
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            String chinese = request.getParameter("chinese");
            String math = request.getParameter("math");
            String english = request.getParameter("english");
            String score = request.getParameter("score");
            StudentDO studentDO=new StudentDO();
            studentDO.setName(name);
            studentDO.setChinese(chinese);
            studentDO.setMath(math);
            studentDO.setEnglish(english);
            studentDO.setScore(score);
            studentDO.setId(id);
            studentService.addStudent(studentDO);
            response.sendRedirect(request.getContextPath()+"/studentServlet?type=toStudentManage");
        }
        else if("toUpdate".equals(type)){
            String studentId =request.getParameter("id");
            String pageNow =request.getParameter("pageNow");
            StudentVO studentVO=studentService.getStudentById(studentId);
            request.setAttribute("studentVO",studentVO);
            request.getRequestDispatcher("/WEB-INF/student/update.jsp").forward(request,response);
        }
        else if("update".equals(type)){
            String studentId =request.getParameter("id");
            String name = request.getParameter("name");
            String chinese = request.getParameter("chinese");
            String math = request.getParameter("math");
            String english = request.getParameter("english");
            String score = request.getParameter("score");
            String pageNow=request.getParameter("pageNow");
            StudentDO studentDO=new StudentDO();
            studentDO.setId(studentId);
            studentDO.setName(name);
            studentDO.setChinese(chinese);
            studentDO.setMath(math);
            studentDO.setEnglish(english);
            studentDO.setScore(score);
            studentService.updateStudent(studentDO);
            response.sendRedirect(request.getContextPath()+"/studentServlet?type=toStudentManage&pageNow="+pageNow);
        }
        else if("delete".equals(type)){
            String studentId =request.getParameter("id");

            studentService.deleteStudentById(studentId);
            response.sendRedirect(request.getContextPath()+"/studentServlet?type=toStudentManage");
        }
    }
}
