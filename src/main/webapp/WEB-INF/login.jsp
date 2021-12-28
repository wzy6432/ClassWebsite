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
<div style="margin-top: 150px">
    <jsp:include page="../top.jsp"/>
    <div id="cont">
        <%
            String message=(String) request.getAttribute("message");
            if(message!=null){
        %>
        <h3 style="color: red;text-align: center">出错信息：${message}</h3>
        <%
            }
        %>
        <form action="<%= request.getContextPath()%>/loginServlet?type=trueLogin" method="post">
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
    <jsp:include page="../bottom.jsp"/>
</div>
<script>
    function resetForm() {
        document.forms[0].reset();
    }
</script>
</body>
</html>
