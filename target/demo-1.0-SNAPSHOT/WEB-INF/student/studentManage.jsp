
<%@ page import="java.util.List" %>
<%@ page import="com.yangyang.pojo.StudentVO" %>
<%@ page import="com.yangyang.pojo.TableResult" %><%--
  Created by IntelliJ IDEA.
  User: Shuliyuan
  Date: 2021/11/24
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理-班级管理系统</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/signin.css" rel="stylesheet">
    <link href="../../static/css/manager.css" rel="stylesheet">
    <!-- <LINK rel=stylesheet type=text/css href="../static/css/main.css"> -->
    <script src="../../static/js/jquery-3.1.1.min.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <link href="../../static/css/carousel.css" rel="stylesheet">
    <script src="../../static/js/sign.js"></script>
    <script type=text/javascript src="../../static/js/jquery-1.4a2.min.js"></script>
    <script type=text/javascript src="../../static/js/jquery.KinSlideshow-1.2.1.min.js"></script>
    <style>
        body
        {
            background-image: url(../../static/images/star.jpg);background-size:cover;
        }
        table{
            border-collapse: collapse;
            border-spacing: 0;
            border: 1px solid black;
        }
        tr{
            line-height: 2;
        }
        th,td{
            border: 1px solid black;
            padding: 0 10px;
        }
        #cont{
            text-align: left;
            margin-left: 560px;
            margin-top: 50px;
            line-height: 1.5;

        }
        .nav,.search,.page{
            line-height: 2;
        }
    </style>
</head>
<body>
<div >
<%--    <jsp:include page="../top.jsp"/>--%>

    <div class="navbar-wrapper">
        <div class="container">
            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Find your class</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="/user_class_homepage.jsp">主页</a></li>
                            <li><a href="/upload.jsp">上传文件</a></li>
                            <li><a href="${pageContext.request.contextPath}/servlet/ListFileServlet">下载文件</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div id="cont">
        <section class="nav">
            <a href="#">学生成绩管理</a>
        </section>
        <section class="search">
            <%
                TableResult<StudentVO> tableResult = (TableResult)request.getAttribute("tableResult");
            %>
            <a href="<%=request.getContextPath()%>/studentServlet?type=toAdd">新增学生</a>
            <form method="post" action="<%=request.getContextPath()%>/studentServlet?type=toStudentManage">
                <input type="text" name="name" value="<%= tableResult.getName()%>"/>
                <input type="hidden" name="pageNow" id="pageNow" value="1">
                <input type="submit" value="查询"/>
            </form>
        </section>
        <section>
            <table>
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>语文</th>
                    <th>数学</th>
                    <th>英语</th>
                    <th>总分</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%

                    List<StudentVO> data = tableResult.getData();
                    for (int i = 0; i <data.size() ; i++) {
                        StudentVO studentVO = data.get(i);
                %>
                <tr>
                    <td><%=studentVO.getId()%></td>
                    <td><%=studentVO.getName()%></td>
                    <td><%=studentVO.getChinese()%></td>
                    <td><%=studentVO.getMath()%></td>
                    <td><%=studentVO.getEnglish()%></td>
                    <td><%=studentVO.getScore()%></td>
                    <td>
                        <a href="<%=request.getContextPath()%>/studentServlet?type=delete&id=<%=studentVO.getId()%>">删除</a>
                        <a href="<%=request.getContextPath()%>/studentServlet?type=toUpdate&id=<%=studentVO.getId()%>
                        &pageNow<%=tableResult.getPageNow()%>">更新</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div class="page">
                <%
                    if(tableResult.getPageNow()!=1){
                %>
                <a href="#" onclick="goFirst()">首页</a>
                <a href="#" onclick="goPre()">上一页</a>
                <%
                    }
                %>
                <%
                    if(tableResult.getPageNow()!=tableResult.getPageCount()){
                %>
                <a href="#" onclick="goNext()">下一页</a>
                <a href="#" onclick="goLast()">尾页</a>
                <%
                    }
                %>

                <span>共<%=tableResult.getPageCount()%>页，</span>
                <span>共<%=tableResult.getTotalCount()%>条，</span>
                <span>当前是<%=tableResult.getPageNow()%>页</span>
            </div>
        </section>
    </div>
<%--    <jsp:include page="../bottom.jsp"/>--%>
</div>
<script>
    function goFirst() {
        document.forms[0].submit();
    }
    function goPre() {
        var currentPage="<%=tableResult.getPageNow()%>";
        var prePage=parseInt(currentPage)-1;
        document.getElementById("pageNow").value=prePage;
        document.forms[0].submit();
    }
    function goNext() {
        var currentPage="<%=tableResult.getPageNow()%>";
        var nextPage=parseInt(currentPage)+1;
        document.getElementById("pageNow").value=nextPage;
        document.forms[0].submit();
    }
    function goLast() {
        var pageCountStr="<%=tableResult.getPageCount()%>";
        document.getElementById("pageNow").value=parseInt(pageCountStr);
        document.forms[0].submit();
    }
</script>
</body>
</html>
