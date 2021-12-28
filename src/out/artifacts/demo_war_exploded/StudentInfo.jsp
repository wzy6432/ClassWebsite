<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Easy Profile Blue - templatemo</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
<!-- 
Easy Profile Template
http://www.templatemo.com/tm-467-easy-profile
-->
	<!-- stylesheet css -->
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/font-awesome.min.css">
	<link rel="stylesheet" href="static/css/templatemo-blue.css">
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		// 加载页面
		function initData(){
			$.ajax({
				url:"http://localhost:8080/demo_war_exploded/ajaxServlet",
				data:{action:"jQueryAjax",
				      studentId:20190412310044},
				type:"GET",
				success:function (data){
					alert("服务器返回的个人信息数据是:"+data);
					$(".Intro").html(data.Intro);//加载个人简介
					$("#hobby1").html(data.hobby1);
					$("#hobby2").html(data.hobby2);
					$("#hobby3").html(data.hobby3);
					$(".studentName").html(data.studentName);
					$("#studentId").html(data.UserId);
					$("#classId").html(data.classId);
					$("#college").html(data.college);
					$("#studentType").html(data.studentType);
					$(".experience").html(data.experience);
				},
				dataType:"json"
			});
		};
		$(window).load(function () {
			// $(".test").click(function (){
			//
			// })
			initData()
		});
	</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">

<!-- preloader section -->
<div class="preloader">
	<div class="sk-spinner sk-spinner-wordpress">
       <span class="sk-inner-circle"></span>
     </div>
</div>

<!-- header section -->
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<img src="static/images/tm-easy-profile.jpg" class="img-responsive img-circle tm-border" alt="templatemo easy profile">
				<hr>
				<h1 class="tm-title bold shadow">Hi, I am<span class="um_span studentName"></span></h1>
<!--				<h1 class="white bold shadow">Creative Director</h1>-->
			</div>
		</div>
	</div>
</header>
<%--<button class="test">测试</button>--%>
<%--<form action="ajaxServlet" method="get">--%>

<%--<c:forEach items="${requestScope.studentinfo}" var="studentinfo">--%>
<div class="studentInfo">
<div class="adcenter"><script src="http://www.cssmoban.com/include/new/ggad2_728x90.js"></script></div>
<!-- about and skills section -->
<section class="container">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<div class="about">
				<h3 class="accent">基本信息</h3>
<!--				<h2>Bootstrap v3.3.5</h2>-->
				<p class="Intro">性别：男 年龄：21 学历：大专 期望职位：PHP 程序员 专业技能 熟练应用 PHP+MySQL 技术，能在 WAMP 环境下熟练编程。 理解对于 Web 网站开发的安全性要求，例如防 SQL 注射、令牌加 密等技术。 理解 Web 开发流程，具有 OO 思想，能独立开发网站。 框架技术： 熟练使用 smarty 模板引擎技术,TP 框架开发网站。</p>
				<div class="baseInfo" style="font-size: 20px; margin-top:25px;padding-bottom: 8px;">
					<div>姓名：<span class="studentName"></span></div>
					<div>学号：<span id="studentId"></span></div>
					<div>班级：<span id="classId"></span></div>
					<div>学院:<span id="college"></span></div>
					<div>学生类别：<span id="studentType"></span></div>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12">
			<div class="hobby">
				<h2 class="white">兴趣爱好</h2>
				<strong ><span id="hobby1"></span></strong>
				<span class="pull-right">70%</span>
					<div class="progress">
						<div class="progress-bar progress-bar-primary" role="progressbar" 
                        aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;"></div>
					</div>
				<strong><span id="hobby2"></span></strong>
				<span class="pull-right">85%</span>
					<div class="progress">
						<div class="progress-bar progress-bar-primary" role="progressbar" 
                        aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
					</div>
				<strong><span id="hobby3"></span></strong>
				<span class="pull-right">95%</span>
					<div class="progress">
						<div class="progress-bar progress-bar-primary" role="progressbar" 
                        aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%;"></div>
					</div>
			</div>
		</div>
	</div>
</section>

<!-- contact and experience -->
<section class="container">
	<div class="row">
		<div class="col-md-4 col-sm-12">
			<div class="contact">
				<h2>Contact</h2>
				<div style="font-size: 18px">
					<p><i class="fa fa-map-marker"></i> 地址：<span id="address"></span></p>
					<p><i class="fa fa-phone"></i> 电话：<span id="tel"></span></p>
					<p><i class="fa fa-envelope"></i> 邮箱：<span id="email"></span></p>
				</div>
			</div>
		</div>
		<div class="col-md-8 col-sm-12">
			<div class="experience">
				<h2 class="white">个人经历</h2>
					<div class="experience-content">
						<h4 class="experience-title accent">曾获奖，参加活动等</h4>
<!--						<h5>New Media Company</h5><span></span>-->
<!--						<h5>2035 January - 2036 April</h5>-->
						<p class="experience"></p>
					</div>
			</div>
		</div>
	</div>
</section>
</div>
<%--</c:forEach>--%>
<!-- footer section -->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
<!--				<ul class="social-icons">-->
<!--					<li><a href="#" class="fa fa-facebook"></a></li>-->
<!--                    <li><a href="#" class="fa fa-google-plus"></a></li>-->
<!--					<li><a href="#" class="fa fa-twitter"></a></li>-->
<!--					<li><a href="#" class="fa fa-dribbble"></a></li>-->
<!--					<li><a href="#" class="fa fa-github"></a></li>-->
<!--					<li><a href="#" class="fa fa-behance"></a></li>-->
<!--				</ul>-->
			</div>
		</div>
	</div>
</footer>

<!-- javascript js -->	
<script src="static/js/jquery.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery.backstretch.min.js"></script>
<script src="static/js/custom.js"></script>

<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
<div class="copyrights" id="links20210126">
	Collect from <a href="http://www.cssmoban.com/"  title="网站模板">模板之家</a>
	<a href="http://cooco.net.cn/" title="组卷网">组卷网</a>
</div>
</body>
</html>