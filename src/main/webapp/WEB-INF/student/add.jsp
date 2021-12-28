<%--
  Created by IntelliJ IDEA.
  User: Shuliyuan
  Date: 2021/11/24
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生页面-班级管理系统</title>
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
        <form action="<%= request.getContextPath()%>/studentServlet?type=add" method="post">
            <div>
                <label>
                    学号:<input type="text" name="id">
                </label>
            </div>
            <div>
                <label>
                    姓名:<input type="text" name="name" >
                </label>
            </div>
            <div>
                <label>
                    语文:<input type="text" name="chinese" >
                </label>
            </div>
            <div>
                <label>
                    数学:<input type="text" name="math">
                </label>
            </div>
            <div>
                <label>
                    英语:<input type="text" name="english">
                </label>
            </div>
            <div>
                <label>
                    总分:<input type="text" name="score" meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                </label>
            </div>
            <div>
                <input type="submit" value="确认添加"></input>
            </div>
        </form>
    </div>
    <jsp:include page="../../bottom.jsp"/>
</div>
</body>
</html>
