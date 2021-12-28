<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Author:Ye Chenglong
  Date: 2021/12/15
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User_Class</title>
  <!-- Bootstrap core CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="static/css/dashboard.css" rel="stylesheet">
  <link href="static/css/signin.css" rel="stylesheet">
  <script src="static/js/jquery-3.1.1.min.js"></script>
  <script src="static/js/bootstrap.min.js"></script>
  <script src="static/js/user_notice.js"></script>
<%--  <script SRC="static/js/user_class.js"></script>--%>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
  <script>

  </script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">find your class</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="StudentInfo.jsp">个人信息</a></li>
        <li><a href="user_class_homepage.jsp">班级主页</a> </li>
        <li class="active"><a href="usernotice.jsp">班级公告</a></li>
<%--        <li><a href="userclass.html">班级成员</a></li>--%>
<%--        <li><a href="index.jsp">退出</a> </li>--%>
      </ul>
    </div>
  </div>
</nav>


  <script id="list_UNotice_Temp" type="text/x-jQuery-tmpl">
        <li class="list-group-item">
            <div class="checkbox">
                <label>${Title}</label>
                <label>${Date}</label>
            </div>
            <div class="pull-right action-buttons">
                <a no-id=${Id} onclick="ShowNotice(this)" ><span class="glyphicon glyphicon-book">查看</span></a>
            </div>
        </li>
    </script>

  <div class="col-sm-8 col-sm-offset-4 col-md-9 col-md-offset-3 main">
    <div class="row placeholder" id="ShowClassTitle">
      <h4>公告栏</h4>
    </div>
    <div class="input-group" style="max-width: 500px">
      <input type="text" class="form-control" id="search_notice_key" placeholder="请输入公告标题(如青年大学习)">
      <span class="input-group-btn" id="search_title">
                <button class="btn btn-primary" type="button" onclick="Search_UNotice()" ><span class="glyphicon glyphicon-search"></span></button>
            </span>
    </div>
    <div class="row">
      <div class="panel-body" style="max-width: 1000px">
        <ul id="list_UNotice" class="list-group">

        </ul>
      </div>
    </div>
  </div>
</div>

<div class="col-md-8 col-sm-12">
  <div class="experience">
    <h3 class="white" id="classId"></h3>
    <div class="experience-content">
<%--      <h4 class="experience-title accent"></h4>--%>
      <p class="experience" id="notice"></p>
    </div>
  </div>
</div>

</body>
</html>

