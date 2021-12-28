<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
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

<body>
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
                        <li class="active"><a href="index.jsp">主页</a></li>
                        <li><a href="regist.jsp">注册</a></li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">登录 <span class="caret"></span></a>

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



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    请输入账号和密码
                </h4>
                <br>
                <span class="errorMsg">
                    ${ requestScope.message }
                </span>
            </div>
            <form class="form-signin" action="login-servlet1?type=trueLogin" method='post'>
                <div class="modal-body">
                    <div class="form-group-lg">
                        <label for="recip_account" class="control-label">账户：</label>
                        <input type="text" class="form-control" name="userName" id="userName" required autofocus>
                    </div>
                    <div class="form-group-lg">
                        <label for="inputPassword" class="control-label">密码:</label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">登录</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!--轮播设置-->
<div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active" align="center">
            <div class="first-slide" alt="First slide">
                <img class="img-responsive" src="static/images/封面雪1.jpg" alt="Cinque Terre" width="1730" height="800">
            </div>
            <div class="container">
                <div class="carousel-caption">
                    <h1>欢迎使用find your class</h1>
                    <p>在这里，你可以获取班级的最新资讯~~~</p>
                    <p><a class="btn btn-lg btn-primary" href="regist.jsp" role="button">注册</a></p>
                </div>
            </div>
        </div>
        <div class="item" align="center">
            <div class="Second-slide" alt="Second slide">
                <img class="img-responsive" src="static/images/封面烟花2.jpg" alt="Cinque Terre" width="1730" height="800">
            </div>
            <div class="container">
                <div class="carousel-caption">
                    <h1>欢迎使用find your class</h1>
                    <p>在这里，你可以快速找到班级小伙伴~~~</p>
                    <p><a class="btn btn-lg btn-primary" href="login.jsp" role="button">登录</a></p>
                </div>
            </div>
        </div>
        <div class="item" align="center">
            <div class="third-slide" alt="Third slide">
                <img class="img-responsive" src="static/images/封面公路3.jpg" alt="Cinque Terre" width="1730" height="800">
            </div>
            <div class="container">
                <div class="carousel-caption">
                    <h1>欢迎使用find your class</h1>
                    <p>在这里，你可以下载班级学习资源~~~</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">联系我们</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control left" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control right" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="container marketing">
    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="static/images/pepo.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Here</h2>
            <p>在这里，你可以获取班级的最新资讯~~~</p>
<%--            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="static/images/tel.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Here</h2>
            <p>在这里，你可以快速找到班级小伙伴~~~</p>
<%--            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="static/images/memo.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Here</h2>
            <p>在这里，你可以下载班级学习资源~~~</p>
<%--            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        </div><!-- /.col-lg-4 -->
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.row -->

    <!-- FOOTER -->
    <footer>
<%--        <p class="pull-right"><a href="#">返回顶部</a></p>--%>
        <p align="center">&copy; 2017 Designed by YeChenglong, Inc. &middot; <a href="#">版权所有</a>
    </footer>
</div><!-- /.container -->
</body>

</html>