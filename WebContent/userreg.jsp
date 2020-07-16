<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 新用户注册</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
	<div style="height: 95px; background-color: white;">
		<dl class="header">
			<dt></dt>
			<dd>
				<div class="lxwm">
					<ul>
						<li><a href="userlogin.jsp">登录</a></li>
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
				<h1>新用户注册</h1>
				<small>REGISTER</small>
			</div>
		</div>
	</div>
	<br>


	<form action="Register" method="get" name="form"
		onsubmit="return verify()">
		<div class="input_control">
			<input type="text" class="form_input" placeholder="用户名"
				name="username" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="昵称"
				name="nickname" />
		</div>
		<div class="input_control">
			<input type="password" class="form_input" placeholder="密码"
				name="password" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="年龄" name="age" />
		</div>
		<div class="input_control">
			<div class="rd">
				<input type="radio" name="gender" value="男"> 男 &emsp;&emsp;
				<input type="radio" name="gender" value="女"> 女
			</div>
			<input type="text" class="form_input" placeholder="手机号" name="phone" />
			<br>
			<br> <input id="btn1" type="submit" value="注册">
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