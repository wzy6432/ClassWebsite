<%@ page import="com.yangyang.pojo.StudentVO" %><%--
  Created by IntelliJ IDEA.
  User: Shuliyuan
  Date: 2021/11/24
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新学生页面-班级管理系统</title>
    <style>
        #cont div{
            margin-top: 20px;
            text-align: center;
            padding: 15px;
        }
        #cont div:last-child input:first-child{
            margin-right: 30px;
        }
        #cont div:last-child input:last-child{
            margin-left: 30px;
        }

    </style>
</head>
<body>
<div >
    <jsp:include page="../../top.jsp"/>
    <div id="cont">
        <form action="<%= request.getContextPath()%>/studentServlet?type=update&pageNow=${requestScope.pageNow}" method="post">
            <%
                StudentVO studentVO= (StudentVO) request.getAttribute("studentVO");
            %>
            <div>
                <label>
                    学号:<input type="text" readonly name="id" value="<%=studentVO.getId()%>">
                </label>
            </div>
            <div>
                <label>
                    姓名:<input type="text" name="name" value="${studentVO.name}">
                </label>
            </div>
            <div>
                <label>
                    语文:<input type="text" name="chinese" value="${studentVO.chinese}">
                </label>
            </div>
            <div>
                <label>
                    数学:<input type="text" name="math" value="${studentVO.math}">
                </label>
            </div>
            <div>
                <label>
                    英语:<input type="text" name="english" value="${studentVO.english}">
                </label>
            </div>
            <div>
                <label>
                    总分:<input type="text" name="score" value="${studentVO.score}">
                </label>
            </div>
            <div>
                <input type="submit" value="更新"></input>
            </div>
        </form>
    </div>
    <jsp:include page="../../bottom.jsp"/>
</div>
</body>
</html>
