<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>个人主页</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">

	<!-- stylesheet css -->
	<link rel="stylesheet" href="static/css/bootstrapy.min.css">
	<link rel="stylesheet" href="static/css/font-awesome.min.css">
	<link rel="stylesheet" href="static/css/templatemo-blue.css">
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		// 加载页面
		function initData(){
			$.ajax({
				url:"http://localhost:8080/demo_war_exploded/ajaxServlet",
				data:{action:"jQueryAjax",
				      },
				type:"GET",
				success:function (data){
					alert("服务器返回的个人信息数据是:"+data);
					$("#studentId").html(data.studentId);
					$(".Intro").html(data.Intro);//加载个人简介
					$("#hobby1").html(data.hobby1);
					$("#hobby2").html(data.hobby2);
					$("#hobby3").html(data.hobby3);
					$(".studentName").html(data.studentName);
					$("#classId").html(data.classId);
					$("#college").html(data.college);
					$("#studentType").html(data.studentType);
					$(".experience").html(data.experience);
				},
				dataType:"json"
			});
		};
		$(window).load(function () {
			initData()
		});
	</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" style="background-image: url(static/images/塔尖.jpg);background-size:cover">

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
				<img src="static/images/居居.jpg" class="img-responsive img-circle tm-border" alt="templatemo easy profile">
				<hr>
				<h1 class="tm-title bold shadow">Hi!<span class="um_span studentName"></span></h1>
<!--				<h1 class="white bold shadow">Creative Director</h1>-->
			</div>
		</div>
	</div>
</header>
<div class="studentInfo">
<div class="adcenter"><script src="http://www.cssmoban.com/include/new/ggad2_728x90.js"></script></div>
<!-- about and skills section -->
<section class="container">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<div class="about">
				<h3 class="accent">基本信息</h3>
<!--				<h2>Bootstrap v3.3.5</h2>-->
				<p class="Intro"></p>
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
					<p><i class="fa fa-map-marker"></i> 地址:海南大学</p>
					<p><i class="fa fa-phone"></i> 电话:18507748923</p>
					<p><i class="fa fa-envelope"></i> 邮箱:2499069236@qq.com</p>
				</div>
			</div>
		</div>
		<div class="col-md-8 col-sm-12">
			<div class="experience">
				<h2 class="white">个人经历</h2>
					<div class="experience-content">
						<h4 class="experience-title accent">曾获奖，参加活动等</h4>

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
				<p>More Templates <a href="#" target="_blank" title="Designed_By_杨阳">Designed_By_杨阳</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>

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

</body>
</html>