<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 错误</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
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
			<a href="index.jsp"><li>首页</li></a>
			<a href="bookdisplay.jsp"><li>浏览图书</li></a>
			<a href="booksearch.jsp"><li>搜索图书</li></a>
			<a href="cart.jsp"><li>购物车</li></a>
			<a href="userinfo.jsp"><li id="dangqian">用户中心</li></a>
		</ul>
	</div>

	<div class="empty"></div>

	<div class="head">
		<div class="inner">
			<div class="boxtitle">
				<h1>页面未找到</h1>
				<small>ERROR</small>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="inner">
		<div class="notification">您所访问的页面不存在！</div>
	</div>

	<br>
	<div class="input_control">
		<a href="javascript:history.go(-1);">
			<button id="btn2" onclick="window.location.href('userlogin.jsp')">返回上一级</button>
		</a>
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