<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 清空购物车</title>
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

	<!--nav-->
	<div class="menu">
		<ul class="nav">
			<a href="index.jsp"><li>首页</li></a>
			<a href="bookdisplay.jsp"><li>浏览图书</li></a>
			<a href="booksearch.jsp"><li>搜索图书</li></a>
			<a href="cart.jsp"><li id="dangqian">购物车</li></a>
			<a href="userinfo.jsp"><li>用户中心</li></a>
		</ul>
	</div>

	<div class="empty"></div>
	<%
		for (int j = 0; j <= 50; j++) {
			String book = (String) session.getAttribute("b" + Integer.toString(j));
			try {
				session.removeAttribute("b" + Integer.toString(j));
			} catch (Exception e) {
			}
		}
	%>
	<div class="head">
		<div class="inner">
			<div class="boxtitle">
				<h1>清空购物车</h1>
				<small>EMPTY</small>
			</div>
		</div>
	</div>
	<div class="empty"></div>
	<div class="inner">
		<div class="notification">您已成功清除购物车内全部商品！</div>
	</div>
	<br>
	<div class="input_control">
		<a href="cart.jsp?empty=yes">
			<button id="btn1">继续浏览图书</button>
		</a> <a href="index.jsp">
			<button id="btn2">返回主页</button>
		</a>
	</div>

	<div class="empty"></div>
</body>
</html>