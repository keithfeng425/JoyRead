<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>悦读 - 搜索结果</title>
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
			<a href="index.jsp"><li>首页</li></a>
			<a href="bookdisplay.jsp"><li>浏览图书</li></a>
			<a href="booksearch.jsp"><li id="dangqian">搜索图书</li></a>
			<a href="cart.jsp"><li>购物车</li></a>
			<a href="userinfo.jsp"><li>用户中心</li></a>
		</ul>
	</div>

	<!--main-->

	<br><br>

			<div class="inner">
				<div class="head">
					<h1>搜索结果</h1>
					<small>RESULT</small>
				</div>
			</div> <br> <%
 	String no = null;
 	String name = null;
 	String author = null;
 	String year = null;
 	String publish = null;
 	String price = null;

 	try {
 		name = request.getParameter("name");
 		author = request.getParameter("author");
 		publish = request.getParameter("publish");
 		price = request.getParameter("price");

 		Class.forName("com.mysql.jdbc.Driver");
 		String url = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
 		Connection conn = DriverManager.getConnection(url, "root", "123456");
 		Statement stat = conn.createStatement();
 		String sql = "select * from book where name like '%" + name + "%' and author like '%" + author
 				+ "%' and publish like '%" + publish + "%' and " + price + "";
 		ResultSet rs = stat.executeQuery(sql);
 %>

				<div class="inner">
					<ul>
						<%
							while (rs.next()) {
									no = rs.getString(1);
									name = rs.getString(2);
									author = rs.getString(3);
									year = rs.getString(4);
									publish = rs.getString(5);
									price = rs.getString(6);
						%>
						<div class="search">


							<a href="book.jsp?book=<%=no%>"><img src="cover/<%=no%>.png"></img></a>
							<div class="detail">
								<a href="book.jsp?book=<%=no%>"><h2><%=name%></h2></a>

								<ul class="list">
									<a
										href="searchresult.jsp?name=&author=<%=author%>&publish=&price=price>%3D0"><li><%=author%></li></a>
									<li><%=year%>年 <a
										href="searchresult.jsp?name=&author=&publish=<%=publish%>&price=price>%3D0"><%=publish%></a></li>

									<a href="book.jsp?book=<%=no%>"><div class="price">
											<small>￥</small><%=price%></div>
								</ul>
							</div>
							</a>
						</div>

						<%
							}
								if (no == null) {
									request.getRequestDispatcher("error404.jsp").forward(request, response);
								}
							} catch (Exception e) {
								request.getRequestDispatcher("error404.jsp").forward(request, response);
							}
						%>
					</ul>
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
