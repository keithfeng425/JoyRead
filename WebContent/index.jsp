<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>悦读 - 在线图书商城</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--banner-->
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>

<body>
	<!--header-->
	<div style="height: 95px; background-color: white;">
		<dl class="header">
			<dt></dt>
			<dd>
				<div class="lxwm">
					<ul>
						<li>
							<%
								try {
									String loginuser = (String) session.getAttribute("loginuser");
									if (loginuser != null) {
							%> <a href="userinfo.jsp"><%=loginuser%></a> <%
 	} else {
 %> <a href="userlogin.jsp">登录</a> <%
 	}
 	} catch (Exception e) {
 %> <a href="userlogin.jsp">登录</a> <%
 	}
 %>
						</li>
					</ul>
				</div>
			</dd>
		</dl>
	</div>

	<div class="menu">
		<ul class="nav">
			<a href="index.jsp"><li id="dangqian">首页</li></a>
			<a href="bookdisplay.jsp"><li>浏览图书</li></a>
			<a href="booksearch.jsp"><li>搜索图书</li></a>
			<a href="cart.jsp"><li>购物车</li></a>
			<a href="userinfo.jsp"><li>用户中心</li></a>
		</ul>
	</div>

	<!--banner-->
	<div class="fullSlide">
		<div class="bd">
			<ul>
				<li><img src="img/banner01.png"></li>
				<li><img src="img/banner02.png"></li>
				<li><img src="img/banner03.png"></li>
			</ul>
		</div>
		<div class="hd">
			<ul></ul>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(".fullSlide").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
	</script>

	<!--main-->

	<br><br>

			<div class="inner">
				<div class="head">
					<h1>热销推荐</h1>
					<small>HOT</small>
				</div>
			</div>

			<div class="yw">
				<div class="inner">
					<ul>
						<li><a href="book.jsp?book=02"> <img src="cover/02.png">
									<div class="name">围城</div>
									<div class="author">钱钟书</div></a></li>
						<li><a href="book.jsp?book=08"> <img src="cover/08.png">
									<div class="name">果壳中的宇宙</div>
									<div class="author">史蒂芬·霍金</div></a></li>
						<li><a href="book.jsp?book=10"> <img src="cover/10.png">
									<div class="name">活着</div>
									<div class="author">余华</div></a></li>
						<li><a href="book.jsp?book=14"> <img src="cover/14.png">
									<div class="name">追风筝的人</div>
									<div class="author">卡勒德·胡赛尼</div></a></li>
						<li><a href="book.jsp?book=01"> <img src="cover/01.png">
									<div class="name">人间失格</div>
									<div class="author">太宰治</div></a></li>
						<li><a href="book.jsp?book=04"> <img src="cover/04.png">
									<div class="name">少年读史记</div>
									<div class="author">张嘉骅</div></a></li>
					</ul>
				</div>
			</div>
			<div class="empty"></div>
			<div class="bottom">
				<div class="ba">
					<div class="inner">
						<span class="left">练习作品&emsp;|&emsp;GitHub.com/KeithFeng425</span>
					</div>
				</div>
			</div>
</body>
</html>




















