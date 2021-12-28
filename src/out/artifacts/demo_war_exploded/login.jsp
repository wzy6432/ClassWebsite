<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/11/29
  Time: 7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%--<base href="http://localhost:8080/demo/">--%>
<body>
<div class="form">
    <form action="login-servlet" method="post">
        <input type="hidden" name="action" value="login" />
        <label>用户名称：</label>
        <input class="itxt" type="text" placeholder="请输入学号"
               autocomplete="off" tabindex="1" name="studentId" />
        <br />
        <br />
        <label>用户密码：</label>
        <input class="itxt" type="password" placeholder="请输入密码"
               autocomplete="off" tabindex="1" name="password" />
        <br />
        <br />
        <input type="submit" value="登录" id="sub_btn" />
    </form>
</div>
</body>
</html>
