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
    <title>登陆页面-班级管理系统</title>
    <style>
        #cont div{
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
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Find your class</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="user_class_homepage.jsp.jsp">主页</a></li>
                        <li><a href="regist.jsp">注册</a></li>
                        <li><a href="index.jsp">退出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<div style="margin-top: 250px">
    <jsp:include page="top.jsp"/>
    <div id="cont">
        <%
            String message=(String) request.getAttribute("message");
            if(message!=null){
        %>
        <h3 style="color: red;text-align: center">出错信息：${message}</h3>
        <%
            }
        %>
        <form action="login-servlet1?type=trueLogin" method="post">
            <div>
                <label>
                    用户名:<input type="text" name="userName">
                </label>
            </div>
            <div>
                <label>
                    &nbsp;&nbsp;&nbsp;密码:<input type="password" name="password">
                </label>
            </div>
            <div>
                <input type="submit" value="登录"/>
                <input type="button" onclick="resetForm()" value="重置"/>
            </div>
        </form>
    </div>
    <jsp:include page="bottom.jsp"/>
</div>
<script>
    function resetForm() {
        document.forms[0].reset();
    }
</script>
</body>
</html>
