<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/12/23
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body style="background-image: url(static/images/sakura.jpg);background-size:cover">

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
                        <li><a href="user_class_homepage.jsp">主页</a></li>
<%--                        <li><a href="regist.jsp">注册</a></li>--%>
                        <%--                        测试班级公告和个人信息，后期要把班级公告移到班级主页，未登录不能查看班级公告--%>
                        <li><a href="usernotice.jsp">班级公告</a></li>
                        <li><a href="StudentInfo.jsp">个人信息</a></li>
                        <li  class="active"><a href="upload.jsp">上传文件</a></li>
                        <%--                        <li><a href="upload.jsp">上传文件</a></li>--%>
                        <li><a href="${pageContext.request.contextPath}/servlet/ListFileServlet">下载文件</a></li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<br>
<br>
<br>
<br>
<form action="UploadHandleServlet" enctype="multipart/form-data" method="post" style="margin-left: auto;margin-right: auto;width: 200px;">
             上传用户：<input type="text" name="username"><br/>
             上传文件1：<input type="file" name="file1"><br/>
             上传文件2：<input type="file" name="file2"><br/>
             <input type="submit" value="提交">
         </form>
</body>
</html>
