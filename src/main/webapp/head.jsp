<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/11/29
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>

<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<%--<link type="text/css" rel="stylesheet" href="static/css/style.css" >--%>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
