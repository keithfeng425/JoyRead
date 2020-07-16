<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>悦读 - 管理注册用户</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/warning.js"></script>
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
									if (loginuser.equals("管理员")) {
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
		String password = null;
		String nickname = null;
		String age = null;
		String gender = null;
		String phone = null;
	%>

	<div class="inner">
		<div class="book">
			<div class="head">
				<h1>用户管理</h1>
				<small>ADMINISTRATE</small>
			</div>
		</div>
	</div>
	<br>

	<div class="inner">
		<div class="cart">
			<table>
				<tr>
					<td width="120">用户名</td>
					<td width="120">密码</td>
					<td width="120">昵称</td>
					<td width="50">年龄</td>
					<td width="50">性别</td>
					<td width="180">手机号</td>
					<td width="120"></td>
				</tr>
				<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
						Connection conn = DriverManager.getConnection(url, "root", "123456");
						Statement stat = conn.createStatement();
						String loginuser = (String) session.getAttribute("loginuser");
						ResultSet rs = stat.executeQuery("select * from user where not username='admin'");

						if (loginuser == null) {
							response.sendRedirect("error404.jsp");
						}
						int i = 0;
						while (rs.next()) {
							username = rs.getString(1);
							password = rs.getString(2);
							nickname = rs.getString(3);
							age = rs.getString(4);
							gender = rs.getString(5);
							phone = rs.getString(6);
				%>
				<tr>
					<td><%=username%></td>
					<td><%=password%></td>
					<td><%=nickname%></td>
					<td><%=age%></td>
					<td><%=gender%></td>
					<td><%=phone%></td>
					<td align="center"><input type="button" value="删除" id="btn3"
						onclick="window.location.href='UserDelete?del=<%=username%>'"></td>
					<%
						i++;
							}
						}

						catch (Exception e) {
							System.out.print(e);
							response.sendRedirect("error404.jsp");
							return;
						}
					%>
				
			</table>
		</div>
	</div>

	<br>
	<br>
	<div class="input_control">
		<a href="javascript:void(0);" onclick="firm2()">
			<button id="btn6">删除全部用户</button>
		</a> <a href="cartempty.jsp">
			<button id="btn2">强制清空购物车</button>
		</a> <a href="userinfo.jsp">
			<button id="btn2">返回用户中心</button>
		</a>
	</div>

	<div class="empty"></div>
</body>
</html>