<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/12/23
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>find your class</title>
    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
    <!-- <LINK rel=stylesheet type=text/css href="../static/css/main.css"> -->
    <script src="static/js/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
    <link href="static/css/carousel.css" rel="stylesheet">
    <script src="static/js/sign.js"></script>
    <script type=text/javascript src="static/js/jquery-1.4a2.min.js"></script>
    <script type=text/javascript src="static/js/jquery.KinSlideshow-1.2.1.min.js"></script>
    <script type=text/javascript>
        $(function(){
            $("#KinSlideshow").KinSlideshow({
                moveStyle:"down",
                intervalTime:8,
                mouseEvent:"mouseover",
                titleFont:{TitleFont_size:14,TitleFont_color:"#FF0000"}
            });
        })
    </script>
    <style type=text/css>
        H3.title {
            font-family: "微软雅黑", Verdana;
            font-size: 16px
        }
    </style>
</head>
<body style="background-image: url(static/images/气球.jpg);background-size:cover;font-size: 20px">

<div  style="margin-right: auto;margin-left: auto;width: 500px;">
<!-- 遍历Map集合 -->
     <c:forEach var="me" items="${fileNameMap}">
             <c:url value="/servlet/DownLoadServlet" var="downurl">
                 <c:param name="filename" value="${me.key}"></c:param>
             </c:url>
             ${me.value}<a href="${downurl}">下载</a>
             <br/>
         </c:forEach>
</div>
</body>
</html>
