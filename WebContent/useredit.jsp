<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 修改个人信息</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div style="height: 95px; background-color: white;">
		<dl class="header">
			<a href="index.jsp"><dt></dt></a>
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
		String password = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
			Connection conn = DriverManager.getConnection(url, "root", "123456");
			Statement stat = conn.createStatement();
			String loginuser = (String) session.getAttribute("loginuser");
			ResultSet rs = stat.executeQuery("select * from user where nickname='" + loginuser + "'");

			while (rs.next()) {
				username = rs.getString(1);
				password = rs.getString(2);
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

	<div class="head">
		<div class="inner">
			<div class="boxtitle">
				<h1>修改信息</h1>
				<small>EDIT</small>
			</div>
		</div>
	</div>
	<br>
	<br>


	<form action="UserEdit" method="get" name="form"
		onsubmit="return verify()">
		<div class="input_control">
			<input type="text" class="form_input" placeholder="用户名"
				name="username" value="<%=username%>" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="昵称"
				name="nickname" value="<%=nickname%>" />
		</div>
		<div class="input_control">
			<input type="password" class="form_input" placeholder="新密码"
				name="password" value="<%=password%>" />
		</div>
		<div class="input_control">
			<input type="text" class="form_input" placeholder="年龄" name="age"
				value="<%=age%>" />
		</div>
		<div class="input_control">
			<div class="rd">
				<%
					if (gender.equals("男")) {
				%>
				<input type="radio" name="gender" value="男" checked="checked">
				男 &emsp;&emsp; <input type="radio" name="gender" value="女">
				女
				<%
 	} else {
 %>
				<input type="radio" name="gender" value="男"> 男 &emsp;&emsp;
				<input type="radio" name="gender" value="女" checked="checked">
				女
				<%
					}
				%>
			</div>
			<input type="text" class="form_input" placeholder="手机号" name="phone"
				value="<%=phone%>" /> <br>
			<br> <input id="btn1" type="submit" value="修改">
		</div>
	</form>

	<div class="empty"></div>
	<div class="empty"></div>
	<div class="empty"></div>
	<div class="input_control">
		<a href="userlogout.jsp">
			<button id="btn1">修改信息</button>
		</a> <a href="userlogout.jsp">
			<button id="btn2">注销</button>
		</a>
	</div>

	<div class="empty"></div>
</body>
</html>