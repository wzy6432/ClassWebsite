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
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <%--    <script src="static/js/sign.js"></script>--%>
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        //页面加载完成之后

    </script>
</head>
<%--<base href="http://localhost:8080/demo/">--%>
<body  style="background-image: url(static/images/snow.jpg);background-size:cover">
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
                        <li><a href="regist.jsp">注册</a></li>
                        <li class="active"><a href="login.jsp">登录</a></li>

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
        <form class="form-signin" action="login-servlet" method="post">
            <br>
            <h3 class="form-signin-heading" align="center"><span class="errorMsg">
                ${ empty requestScope.msg ? "请输入学号和密码":requestScope.msg }
            </span>
            </h3>
            <br>
            <div class="form-group-lg">
                <input  type="text" id="studentId" name="studentId" class="form-control" placeholder="学号" value="${requestScope.username}" required
                        autofocus>
            </div>
            <br>
            <div class="form-group-lg">
                <input type="password" id="password" name="password" class="form-control"
                       placeholder="密码" required>
            </div>

            <br />
            <br />
            <input type="submit" value="登录" id="sub_btn">
        </form>
        <!--/div-->
        <!--<div class="col-lg-2"></div>-->
    </div>
</div> <!-- /container -->

</body>
</html>
