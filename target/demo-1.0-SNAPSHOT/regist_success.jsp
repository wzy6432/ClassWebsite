<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/12/24
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%--    <%@ include file="/head.jsp"%>--%>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <%--    <script src="static/js/sign.js"></script>--%>
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
</head>

<body  style="background-image: url(static/images/sea.jpg);background-size:cover">
<div id="test"></div>
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
                    <a class="navbar-brand" href="index.jsp">Find your class</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">主页</a></li>
                        <li class="active"><a href="regist.jsp">注册</a></li>
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">登录 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="login.jsp">用户入口</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal">管理员入口</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container">
    <div class="row">
        <!--<div class="col-lg-2"></div>-->
        <!--<div class="col-lg-8">-->
        <form class="form-signin" action="registSuccessServlet" method="post">
            <br>
            <h3 class="form-signin-heading" align="center">请输入你的个人信息</h3>
            <br>
            <span class="errorMsg">
                ${ requestScope.msg }
            </span>
            <div class="form-group-lg">
                学号<input  type="text" id="studentId" name="studentId" class="form-control" placeholder="请与注册学号保持一致" required
                        autofocus>
            </div>
            <br>
            <div class="form-group-lg">
                姓名<input type="text" id="studentName" name="studentName" class="form-control"
                        required>
            </div>
            <div class="form-group-lg">
                班级<input type="text" id="classId" name="classId" class="form-control"
                        required>
            </div>
            <div class="form-group-lg">
                学院<input type="text" id="college" name="college" class="form-control"
                         required>
            </div>
            <div class="form-group-lg">
                学生类型<input type="text" id="studentType" name="studentType" class="form-control"
                         required>
            </div>
            <div class="form-group-lg">
                个人经历<input type="text" id="experience" name="experience" class="form-control"
                         required>
            </div>
            <div class="form-group-lg">
                兴趣爱好1<input type="text" id="hobby1" name="hobby1" class="form-control"
                         required>
            </div>
            <div class="form-group-lg">
                兴趣爱好2<input type="text" id="hobby2" name="hobby2" class="form-control"
                         required>
            </div>
            <div class="form-group-lg">
                兴趣爱好3<input type="text" id="hobby3" name="hobby3" class="form-control"
                         required>
            </div>
            <br />
            <br />
            <input type="submit" value="提交" id="sub_btn">
        </form>
        <!--/div-->
        <!--<div class="col-lg-2"></div>-->
    </div>
</div> <!-- /container -->

</body>
</html>

