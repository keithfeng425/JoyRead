<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 图书搜索</title>
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
			<a href="booksearch.jsp"><li id="dangqian">搜索图书</li></a>
			<a href="cart.jsp"><li>购物车</li></a>
			<a href="userinfo.jsp"><li>用户中心</li></a>
		</ul>
	</div>

	<div class="empty"></div>

	<div class="head">
		<div class="inner">
			<div class="boxtitle">
				<h1>图书搜索</h1>
				<small>SEARCH</small>
			</div>
		</div>
	</div>
	<br>
	<div class="notification">支持模糊搜索</div>
	<form action="searchresult.jsp" method="get" name="form">
		<div class="input_control">
			<input type="text" class="form_input" placeholder="书名" name="name" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="作者" name="author" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="出版社"
				name="publish" />
		</div>
		<div class="input_control">
			<select name="price">
				<option value="price>=0">全部价格</option>
				<option value="price>=0 and price<=30">0~30元</option>
				<option value="price>=30 and price<=50">30~50元</option>
				<option value="price>=50 and price<=100">50~100元</option>
				<option value="price>=100">100元以上</option>
			</select> <br> <br> <input id="btn1" type="submit" value="搜索">
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