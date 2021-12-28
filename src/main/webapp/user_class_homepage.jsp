<%--
  Created by IntelliJ IDEA.
  User: yy160541
  Date: 2021/12/15
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
    <META content="IE=7.0000" http-equiv="X-UA-Compatible">
    <TITLE>班级网站</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <STYLE type=text/css></STYLE>

    <SCRIPT type=text/javascript src="static/js/jquery-1.4a2.min.js"></SCRIPT>

    <SCRIPT type=text/javascript src="static/js/jquery.KinSlideshow-1.2.1.min.js"></SCRIPT>

    <SCRIPT type=text/javascript>

        $(function(){

            $("#KinSlideshow").KinSlideshow({

                moveStyle:"down",

                intervalTime:8,

                mouseEvent:"mouseover",

                titleFont:{TitleFont_size:14,TitleFont_color:"#FF0000"}

            });

        })

    </SCRIPT>

    <STYLE type=text/css>
        .code {
            BORDER-BOTTOM: #9ec9fe 1px solid;
            BORDER-LEFT: #9ec9fe 1px solid;
            PADDING-BOTTOM: 20px;
            PADDING-LEFT: 20px;
            PADDING-RIGHT: 20px;
            BACKGROUND: #ecf3fd;
            HEIGHT: auto;
            BORDER-TOP: #9ec9fe 1px solid;
            BORDER-RIGHT: #9ec9fe 1px solid;
            PADDING-TOP: 20px
        }

        .code PRE {
            FONT-FAMILY: "Courier New";
            FONT-SIZE: 14px
        }

        .code PRE CODE.note {
            COLOR: #999
        }

        .code2 {
            BORDER-BOTTOM: #feb0b0 1px solid;
            BORDER-LEFT: #feb0b0 1px solid;
            MARGIN-TOP: 10px;
            BACKGROUND: #fff1f1;
            BORDER-TOP: #feb0b0 1px solid;
            BORDER-RIGHT: #feb0b0 1px solid
        }

        .code2 PRE {
            MARGIN-LEFT: 20px;
            FONT-SIZE: 12px
        }

        .info {
            MARGIN: 20px 0px 50px;
            FONT-FAMILY: Verdana;
            COLOR: #666666;
            FONT-SIZE: 12px
        }

        .info P {
            PADDING-BOTTOM: 0px;
            LINE-HEIGHT: 22px;
            TEXT-INDENT: 40px;
            MARGIN: 0px;
            PADDING-LEFT: 0px;
            PADDING-RIGHT: 0px;
            PADDING-TOP: 0px
        }

        H2.title {
            PADDING-BOTTOM: 0px;
            MARGIN: 50px 0px 0px;
            PADDING-LEFT: 0px;
            PADDING-RIGHT: 0px;
            FONT-FAMILY: "微软雅黑", Verdana;
            FONT-SIZE: 18px;
            PADDING-TOP: 0px
        }

        H2.title SPAN.titleInfo {
            FONT-FAMILY: Verdana;
            COLOR: #333;
            MARGIN-LEFT: 10px;
            FONT-SIZE: 12px
        }

        H3.title {
            FONT-FAMILY: "微软雅黑", Verdana;
            FONT-SIZE: 16px
        }

        .importInfo {
            FONT-FAMILY: Verdana;
            FONT-SIZE: 14px
        }
    </STYLE>
    <LINK rel=stylesheet type=text/css href="static/css/main.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.18106">
</HEAD>

<BODY>
<DIV id=header><IMG src="static/images/主页-head.jpg" width=980 height=370>
    <DIV id=nav>
        <UL>
            <LI><A href="user_class_homepage.jsp">网站首页</A> </LI>
            <LI><A href="static/images/timetable.jpg">课程信息</A> </LI>
            <li><a href="usernotice.jsp">班级公告</a></li>
            <LI><A href="StudentInfo.jsp">个人信息</A> </LI>
            <LI><A href="upload.jsp">上传文件</A></LI>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet">学习资源</A> </LI>
            <LI><A href="index.jsp">退出</A></LI>
                <DIV class=cls></DIV>
            </LI>
        </UL>
    </DIV>
</DIV>
<DIV id=content>
    <DIV class=left>
        <H3>班级风采</H3>
        <DIV style="VISIBILITY: hidden" id=KinSlideshow><A href="http://lcjiaoyu.cn/web/ShowNewsInfo.Asp?NewsInfoID=2456"
                                                           target=_blank><A href="http://lcjiaoyu.cn/web/ShowNewsInfo.Asp?NewsInfoID=2456" target=_blank><IMG alt=班级风采
                                                                                                                                                              src="static/images/躺地上.jpg" width=650 height=300></A><A href="" target=_blank>
            <IMG alt=班级风采 src="static/images/国旗班.jpg" width=650 height=300></A> <A href="" target=_blank>
            <IMG alt=班级风采 src="static/images/校门人.jpg" width=650 height=300></A> <A href="" target=_blank>
            <IMG alt=班级风采 src="static/images/运动会1.jpg" width=650 height=300></A> <A href="" target=_blank>
            <IMG alt="班级风采" src="static/images/运动会2.jpg" width=650 height=300></A></DIV>
        <DIV class=left-l><IMG src="static/images/班委.png" width=243 height=350></DIV>
        <DIV class=right-r>
            <H3>班级简介</H3>
            <P class=" hg">计科4班是一个具有团结精神积极向上的班集体，在学校举行的一些课外活动中获得了优异的成绩，在各项活动中都取得过优异的成绩。这是他们的荣誉，是计科4班的骄傲！</P>
            <P class=" hg">
                计科4班是一个具有团结友爱，互帮互助的班集体，我们互相学习，共同进步，一直是校优秀班集体，在学校乃至省内夺得过众多奖项，我们有爱心，我们有热情，我们有活力，我们相信我们一定能创造出属于我们自己的事业！</P>
        </DIV>
        <DIV class=cls></DIV>
    </DIV>
    <DIV class=right>
        <H3>班级公告</H3>
        <MARQUEE onmouseover=stop() onmouseout=start() direction=up scrollAmount=2>
            <P style="COLOR: #900" align=center>活动通知</P>
            <P style="TEXT-INDENT: 2em">各位同学：
                大家好！
                近期网络各大社交平台上经常出现假借教务处、团委、学生会等单位和以社会实践、社团活动、兼职等名义，提供学习资料、参与大学活动、学校通知、高额报酬等为噱头，鼓动同学加入群聊。
                为防止同学们被此类诈骗行为迷惑，造成不必要的损失，烦请各位班委提醒广大学生注意甄别，谨防上当受骗。</P>
            <P align=right>计算机科学与技术学院团委<BR>2021年11月23日</P>
        </MARQUEE>
        <H3><a href="${pageContext.request.contextPath}/servlet/ListFileServlet" target="blank">学习资源</a></H3>
        <UL>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                电路PPT</A><SPAN class=news_sj>[2021-3-10]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                软件工程PPT</A><SPAN class=news_sj>[2021-3-11]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                面向对象程序设计PPT</A><SPAN class=news_sj>[2021-1-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                MySql数据库安装教程</A><SPAN class=news_sj>[2021-12-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                计算机图形学课程设计教程</A><SPAN class=news_sj>[2021-12]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                软件工程课程设计教程</A><SPAN class=news_sj>[2021-12-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                数据库课程设计教程</A><SPAN class=news_sj>[2021-12-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                数据库教材</A><SPAN class=news_sj>[2021-12-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                软件工程教材</A><SPAN class=news_sj>[2021-12-20]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                tcp/ip实验教程</A><SPAN class=news_sj>[2021-10-5]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                计算机组成原理实验教程</A><SPAN class=news_sj>[2021-10-5]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                高等数学教程</A><SPAN class=news_sj>[2021-10-5]</SPAN>
                <DIV class=cls></DIV>
            <LI><A href="${pageContext.request.contextPath}/servlet/ListFileServlet"><IMG border=0 src="static/images/dian.jpg" width=8 height=6>
                java实验报告模板</A><SPAN class=news_sj>[2021-9-12]</SPAN>
                <DIV class=cls></DIV>
            </LI>
        </UL>
    </DIV>
    <DIV class=cls></DIV>
    <DIV id=pic_news>
        <STYLE type=text/css>
            #demo {
                BORDER-BOTTOM: #ccc 1px dashed;
                BORDER-LEFT: #ccc 1px dashed;
                WIDTH: 976px;
                BACKGROUND: #fff;
                OVERFLOW: hidden;
                BORDER-TOP: #ccc 1px dashed;
                BORDER-RIGHT: #ccc 1px dashed
            }

            #demo IMG {
                BORDER-BOTTOM: #f2f2f2 3px solid;
                BORDER-LEFT: #f2f2f2 3px solid;
                BORDER-TOP: #f2f2f2 3px solid;
                BORDER-RIGHT: #f2f2f2 3px solid
            }

            #indemo {
                WIDTH: 800%;
                FLOAT: left
            }

            #demo1 {
                FLOAT: left
            }

            #demo2 {
                FLOAT: left
            }
        </STYLE>

        <DIV id=demo>
            <DIV id=indemo>
                <DIV id=demo1>
                    <DIV class=gd_pic><IMG src="static/images/校门.jpg" width=120 height=120><BR>习主席讲话</DIV>
                    <DIV class=gd_pic><IMG src="static/images/校门1.jpg" width=120 height=120><BR>海大北门
                    </DIV>
                    <DIV class=gd_pic>&lt; <IMG src="static/images/学校风光1.jpg" width=120 height=120><BR>校园夜景
                    </DIV>
                    <DIV class=gd_pic><IMG src="static/images/学校风光2.jpg" width=120 height=120><BR>魅力海大
                    </DIV>
                    <DIV class=gd_pic><IMG src="static/images/学校风光3.jpg" width=120 height=120><BR>校训 </DIV>
                    <DIV class=gd_pic><IMG src="static/images/学校风光4.jpg" width=120 height=120><BR>黄昏美景
                    </DIV>
                    <DIV class=gd_pic><IMG src="static/images/楼.jpg" width=120 height=120><BR>风和日丽
                    </DIV>
                    <DIV class=cls></DIV>
                </DIV>
                <DIV id=demo2></DIV>
            </DIV>
        </DIV>


        <SCRIPT>

            // <!--

            // var speed=10;

            // var tab=document.getElementById("demo");

            // var tab1=document.getElementById("demo1");

            // var tab2=document.getElementById("demo2");

            // tab2.innerHTML=tab1.innerHTML;

            // function Marquee(){

            // if(tab2.offsetWidth-tab.scrollLeft<=0)

            // tab.scrollLeft-=tab1.offsetWidth

            // else{

            // tab.scrollLeft++;

            // }

            // }

            // var MyMar=setInterval(Marquee,speed);

            // tab.onmouseover=function() {clearInterval(MyMar)};

            // tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};

            // -->

        </SCRIPT>
    </DIV>
</DIV>
<DIV class=cls></DIV>
<DIV></DIV>
<DIV id=footer>
    <P>版权所有：计算机科学与技术（4）班软件工程课设<br>All Copyright 1954-2021 [ 海南大学 ] All Rights Reserved<BR>咨询电话：18765863749
    </P>
    <P>希望课设得高分！</P>
</DIV>
<DIV></DIV><!-- 请勿屏蔽广告，否则关闭网站,Don't Remove Ad,Otherwise Close WebSite --></TEXTAREA></IFRAME></SCRIPT></NOSCRIPT>
<SCRIPT language=javascript type=text/javascript src=""></SCRIPT>
</BODY>

</HTML>
