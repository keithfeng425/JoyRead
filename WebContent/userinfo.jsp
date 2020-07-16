<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 用户中心</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	function admin() {
		var loginuser = document.getElementById("lu").innerText;
		if (loginuser == "管理员") {
			document.getElementById("btn1").style.display = "none";
			document.getElementById("age").style.display = "none";
			document.getElementById("gender").style.display = "none";
			document.getElementById("phone").style.display = "none";
			document.getElementById("btn5").style.display = "display";
		} else
			document.getElementById("btn5").style.display = "none";
	}
</script>
</head>
<body onload="admin()">
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
							%> <a href="userinfo.jsp" id="lu"><%=loginuser%></a> <%
 	} else {

 			response.sendRedirect("needlogin.jsp");
 			return;

 		}
 	} catch (Exception e) {
 		response.sendRedirect("needlogin.jsp");
 		return;
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
			<a href="cart.jsp"><li>购物车</li></a>
			<a href="userinfo.jsp"><li id="dangqian">用户中心</li></a>
		</ul>
	</div>

	<br>
	<br>

	<%
		String username = null;
		String nickname = null;
		String age = null;
		String gender = null;
		String phone = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
			Connection conn = DriverManager.getConnection(url, "root", "123456");
			Statement stat = conn.createStatement();
			String loginuser = (String) session.getAttribute("loginuser");
			ResultSet rs = stat.executeQuery("select * from user where nickname='" + loginuser + "'");

			while (rs.next()) {
				username = rs.getString(1);
				nickname = rs.getString(3);
				age = rs.getString(4);
				gender = rs.getString(5);
				phone = rs.getString(6);
			}
			if (loginuser == null) {
				response.sendRedirect("error404.jsp");
			}
		} catch (Exception e) {
			System.out.print(e);
			response.sendRedirect("error404.jsp");
			return;
		}
	%>

	<div class="inner">
		<div class="book">
			<div class="head">
				<h1>个人信息</h1>
				<small>INFO</small>
			</div>
		</div>
	</div>
	<br>

	<div class="inner">
		<div class="book">
			<div class="head">
				<h2>
					&emsp;
					<%=nickname%></h2>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="inner">
		<div class="userinfo">
			<ul class="list">
				<li>用户名：<%=username%></li>
				<li id="age">年龄：<%=age%> 岁
				</li>
				<li id="gender">性别：<%=gender%></li>
				<li id="phone">手机号：<%=phone%></li>
			</ul>
		</div>
	</div>

	<br>
	<br>
	<div class="input_control">
		<a href="useredit.jsp">
			<button id="btn1">修改信息</button>
		</a> <a href="administrate.jsp">
			<button id="btn5">管理注册用户</button>
		</a> <a href="userlogout.jsp">
			<button id="btn2">注销</button>
		</a>
	</div>

	<div class="empty"></div>
</body>
</html>