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
                var studentIdPatt=/^d{14}$/;
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
<body>
<h1>注册班级个人账号</h1>
<span class="errorMsg">
    ${ requestScope.msg }
</span>
<div class="form">
    <form action="registServlet" method="post">
        <input type="hidden" name="action" value="regist">
        <label>学号：</label>
        <input class="itxt" type="text" placeholder="请输入学号进行注册"
<%--               value="${requestScope.username}"--%>
               autocomplete="off" tabindex="1" name="studentId" id="studentId" />
        <br />
        <br />
        <label>用户密码：</label>
        <input class="itxt" type="password" placeholder="请输入密码"
               autocomplete="off" tabindex="1" name="password" id="password" />
        <br />
        <br />
        <label>确认密码：</label>
        <input class="itxt" type="password" placeholder="确认密码"
               autocomplete="off" tabindex="1" name="repwd" id="repwd" />
        <br />
        <br />

        <input type="submit" value="注册" id="sub_btn" />
    </form>
</div>
</body>
</html>
