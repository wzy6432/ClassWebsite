<!DOCTYPE html>
<html lang="en">
<head>
<title>注册</title>
<!-- custom-theme -->
	<base href="http://localhost:8080/demo_Web_explode/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="src/main/webapp/pages/oyqj-0924-13/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="src/main/webapp/pages/oyqj-0924-13/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="src/main/webapp/pages/oyqj-0924-13/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="src/main/webapp/pages/oyqj-0924-13/css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
	<link href="http://fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
</head>
<script type="text/javascript">
	// 页面加载完成之后
	$(function () {

		$("#studentId").blur(function () {
			//1 获取用户名
			var studentId = this.studentId;
			$.getJSON("http://localhost:63342/demo/UserServlet","action=ajaxExistsStudentId&studentId=" + studentId,function (data) {
				if (data.existstudentId) {
					$("span.errorMsg").text("用户名已存在！");
				} else {
					$("span.errorMsg").text("用户名可用！");
				}
			});
		});


		// 给注册绑定单击事件
		$("#sub_btn").click(function () {
			// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
			//1 获取用户名输入框里的内容
			var studentIdText = $("#studentId").val();
			//2 创建正则表达式对象
			var studentIdPatt = "^d{14}$";
			//3 使用test方法验证
			if (!studentIdPatt.test(studentIdText)) {
				//4 提示用户结果
				$("span.errorMsg").text("用户名不合法！");

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

			// 去掉错误信息
			$("span.errorMsg").text("");

		});

	});

</script>
<body>
<!-- banner -->
	<div class="banner1 jarallax">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1><a class="navbar-brand" href="index.html">Upholstery</a></h1>
				</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-8" id="link-effect-8">
						<ul class="nav navbar-nav">
							<li><a href="index.html">Home</a></li>
							<li><a href="services.html">Services</a></li>
							<li><a href="projects.html">Projects</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Short Codes <b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="icons.html">Web Icons</a></li>
									<li><a href="typography.html">Typography</a></li>
								</ul>
							</li>
							<li class="active"><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
<!-- //banner -->	
<!-- contact -->
	<div class="contact">
		<div class="container">
			<h2 class="w3ls_head"><span>注</span>册</h2>
			<p class="w3agile">一起加入我们吧 杨阳™</p>
			<div class="clearfix"> </div>
			</div>
			<div class="contact-form">
				<h4 style="text-align: center">注册班级会员账号</h4>
				<span class="errorMsg">
				<div class="contact-form-grid">
<!--					提交表单，请求服务器-->
					<form action="regist-servelet" method="post" style="display: flex;align-items: center;justify-content: center">
						<div class="fields-grid">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="studentId" id="studentId" required="" value="${requestScope.studentId}" autocomplete="off" tabindex="1">
								<label>学号</label>
								<span></span>
							</div>
<!--							<div class="styled-input agile-styled-input-top">-->
<!--								<input type="text" name="Phone" required=""> -->
<!--								<label>Phone</label>-->
<!--								<span></span>-->
<!--							</div>-->
							<div class="styled-input">
								<input type="password" name="password" id="password" required="" autocomplete="off" style="height: 25px">
								<label>密码</label>
								<span></span>
							</div> 
							<div class="styled-input">
								<input type="password" name="password" id="repwd" required="" autocomplete="off" style="height: 25px">
								<label>确认密码</label>
								<span></span>
							</div>
							<div class="clearfix"> </div>
						</div>
<!--						<div class="styled-input textarea-grid">-->
<!--							<textarea name="Message" required=""></textarea>-->
<!--							<label>Message</label>-->
<!--							<span></span>-->
<!--						</div>	 -->
						<input type="submit" value="确定" id="sub_btn">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //contact -->

<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_agile_footer_grids">
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Tweets</h3>
					<ul class="agile_footer_grid_list">
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Nam libero tempore, cum soluta nobis est eligendi optio 
							cumque nihil impedit. <span>1 day ago</span></li>
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Itaque earum rerum hic tenetur a sapiente delectus <a href="mailto:info@mail.com">info@mail.com</a>
							cumque nihil impedit. <span>2 days ago</span></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Navigation</h3>
					<ul class="agileits_w3layouts_footer_grid_list">
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a href="services.html">Services</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a href="projects.html">Projects</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Works</h3>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s6.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s2.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s1.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s3.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s4.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="src/main/webapp/pages/oyqj-0924-13/images/s5.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="w3_newsletter_footer_grids">
				<div class="w3_newsletter_footer_grid_left">
					<form action="#" method="post">
						<input type="email" name="Email" placeholder="Email" required="">
						<input type="submit" value="Send" >
					</form>
				</div>
				
				
			</div>
		
			<div class="agileinfo_copyright">
				<p>Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
			</div>
		</div>
	</div>
<!-- //footer -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
</body>
</html>