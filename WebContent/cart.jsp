<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>悦读 - 我的购物车</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--banner-->
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/warning.js"></script>
</head>

<body onload="total()">
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
			<a href="booksearch.jsp"><li>搜索图书</li></a>
			<a href="cart.jsp"><li id="dangqian">购物车</li></a>
			<a href="userinfo.jsp"><li>用户中心</li></a>
		</ul>
	</div>

	<!--main-->

	<br><br> <%!int i = 0;%>
			<div class="inner">
				<div class="cart">
					<form name="form" method="get">
						<table border="1" id="table">
							<tr>
								<td align="center" width="200">书名</td>
								<td align="center" width="100">单价</td>
								<td align="center" width="120">数量</td>
								<td align="center" width="120">小计</td>
								<td align="center" width="120"></td>
							</tr>
							<%
								String add = request.getParameter("add");
								String price = request.getParameter("price");
								session.setAttribute("b" + Integer.toString(i), add);
								session.setAttribute("p" + Integer.toString(i), price);
								int n = 0;
								i++;
								for (int j = 0; j <= i; j++) {
									String book = (String) session.getAttribute("b" + Integer.toString(j));
									String one = (String) session.getAttribute("p" + Integer.toString(j));
									if (book != null) {
										Boolean existed = false;

										for (int c = 0; c < j; c++) {
											String check = (String) session.getAttribute("b" + Integer.toString(c));
											try {
												if (check.equals(book)) {
													existed = true;
													break;
												}
											} catch (Exception e) {
											}
										}

										if (existed == false) {
							%><tr>
								<td>
									<%
										out.println("《" + book + "》");
									%>
								</td>
								<td>
									<%
										out.println(one);
									%>
								</td>
								<td align="center"><div class="am" id="am">
										<input type="button" value="-" onClick="minus(<%=j%>)">&nbsp;
											<input type="text" id="amount" name="amount" value="1">&nbsp;
												<input type="button" value="+" onClick="plus(<%=j%>)">
									</div></td>
								<%
									//System.out.println(j + "\t");
								%>
								<td></td>
								<td align="center"><input type="button" value="删除"
									id="btn3"
									onclick="window.location.href='cartdel.jsp?del=<%=book%>&a=<%=Integer.toString(i)%>'"></td>
							</tr>

							<%
								} else
											j--;
										++n;
										//System.out.println(j);
									}
								}
								if (n == 0)
									i = 0;
								//System.out.println((String)session.getAttribute("b0"));
							%>
						</table>
					</form>
					<br><br>
							<table>
								<tr>
									<td align="right" width="284" style="vertical-align: top;"><div
											style="margin-top: 10px; margin-right: 15px;"></div></td>
									<td width="180" align="right" style="vertical-align: bottom;"><div
											id="totalprice" style="font-size: 48px; font-weight: bold;">00.00</div></td>
									<td width="60" align="left" style="vertical-align: bottom;"><div
											style="margin-bottom: 10px; font-size: 24px; font-weight: bold; margin-left: 5px; margin-right: 20px;">元</div></td>
									<td width="140"><button class="cal" onclick="cal()">结算</button></td>
							</table> <br><br>

									<div class="input_control">
										<a href="bookdisplay.jsp">
											<button id="btn1">继续添加</button>
										</a> <a href="javascript:void(0);" onclick="firm1()">
											<button id="btn2">清空购物车</button>
										</a>
									</div> <br><br>

											<div class="inner">
												<div class="head">
													<h1>热销推荐</h1>
													<small>HOT</small>
												</div>
											</div>

											<div class="yw">
												<div class="inner">
													<ul>
														<li><a href="book.jsp?book=02"> <img
																src="cover/02.png">
																	<div class="name">围城</div>
																	<div class="author">钱钟书</div></a></li>
														<li><a href="book.jsp?book=08"> <img
																src="cover/08.png">
																	<div class="name">果壳中的宇宙</div>
																	<div class="author">史蒂芬·霍金</div></a></li>
														<li><a href="book.jsp?book=10"> <img
																src="cover/10.png">
																	<div class="name">活着</div>
																	<div class="author">余华</div></a></li>
														<li><a href="book.jsp?book=14"> <img
																src="cover/14.png">
																	<div class="name">追风筝的人</div>
																	<div class="author">卡勒德·胡赛尼</div></a></li>
														<li><a href="book.jsp?book=01"> <img
																src="cover/01.png">
																	<div class="name">人间失格</div>
																	<div class="author">太宰治</div></a></li>
														<li><a href="book.jsp?book=04"> <img
																src="cover/04.png">
																	<div class="name">少年读史记</div>
																	<div class="author">张嘉骅</div></a></li>
													</ul>
												</div>
											</div>
				</div>
			</div> <br><br>
					<div class="bottom">
						<div class="ba">
							<div class="inner">
								<span class="left">练习作品&emsp;|&emsp;GitHub.com/KeithFeng425</span>
							</div>
						</div>
					</div>
</body>
</html>
