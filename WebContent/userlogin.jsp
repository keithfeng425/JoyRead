<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 用户登录</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/login.js"></script>
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
							%> <a href="userbgo.jsp"><%=loginuser%></a> <%
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
				<h1>用户登录</h1>
				<small>LOGIN</small>
			</div>
		</div>
	</div>
	<br>

	<%
		String username = "";
		String password = "";
		try {
			Cookie c[] = request.getCookies();
			for (int i = 0; i < c.length; i++) {
				if ("cusername".equals(c[i].getName())) {
					username = c[i].getValue();
				}
				if ("cpassword".equals(c[i].getName())) {
					password = c[i].getValue();
				}
			}
		} catch (Exception e) {
		}
	%>

	<form action="LoginVerify" method="get" name="form"
		onsubmit="return verify()">
		<div class="input_control">
			<input type="text" class="form_input" placeholder="用户名"
				name="username" value="<%=username%>" />
		</div>
		<div class="input_control">
			<input type="password" class="form_input" placeholder="密码"
				name="password" value="<%=password%>" />
		</div>
		<div class="input_control">
			<div class="cbox">
				<input type="checkbox" class="form_input" name="save" value="yes"
					checked />&emsp;记住我<br>
				<br>
				<br>
			</div>
			<input id="btn1" type="submit" value="登录"> <a
				href="userreg.jsp"><input id="btn2" type="button" value="注册新用户"></a>
		</div>
	</form>

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