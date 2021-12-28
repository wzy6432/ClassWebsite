<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/11/29
  Time: 9:03
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
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        //页面加载完成之后
        $(function(){
            //给注册绑定单击事件
            $("#sub_btn").click(function (){
                //验证学号，必须由14位数字组成
                //1.获取用户名输入框里的内容
                var studentId=$("#studentId").val();
                //2.创建正则表达式对象
                var studentIdPatt=/^\d{10,14}$/;
                //3.使用test方法验证
                if(!studentIdPatt.test(studentId)){
                    //4.提示用户结果
                    $("span.errorMsg").text("账号错误！请输入14位的学号");
                    return false;
                }
                // 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
                //1 获取用户名输入框里的内容
                var passwordText = $("#password").val();
                //2 创建正则表达式对象
                var passwordPatt = /^\w{5,12}$/;
                //3 使用test方法验证
                if (!passwordPatt.test(passwordText)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("密码不合法！");

                    return false;
                }

                // 验证确认密码：和密码相同
                //1 获取确认密码内容
                var repwdText = $("#repwd").val();
                //2 和密码相比较
                if (repwdText != passwordText) {
                    //3 提示用户
                    $("span.errorMsg").text("确认密码和密码不一致！");

                    return false;
                }

            })
        })
    </script>
</head>

<body  style="background-image: url(static/images/classmates.jpg);background-size:cover">
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
        <form class="form-signin" action="registServlet" method="post">
            <br>
            <h3 class="form-signin-heading" align="center">请输入学号和密码</h3>
            <br>
            <span class="errorMsg">
                ${ requestScope.msg }
            </span>
            <div class="form-group-lg">
                <input  type="text" id="studentId" name="studentId" class="form-control" placeholder="请输入学号" required
                        autofocus>
            </div>
            <br>
            <div class="form-group-lg">
                <input type="password" id="password" name="password" class="form-control"
                       placeholder="密码由5到12位字母，数字下划线组成" required>
            </div>
            <div class="form-group-lg">
                <input type="password" id="repwd" name="repwd" class="form-control"
                       placeholder="确认密码" required>
            </div>
            <br />
            <br />
            <input type="submit" value="注册" id="sub_btn">
        </form>
        <!--/div-->
        <!--<div class="col-lg-2"></div>-->
    </div>
</div> <!-- /container -->

</body>
</html>
