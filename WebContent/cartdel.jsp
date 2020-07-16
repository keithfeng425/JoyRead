<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除</title>
<script type="text/javascript">
	function countDown(secs, surl) {
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (secs-->0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 10);
		} else {
			location.href = surl;
			-ma
		}
	}
</script>
</head>
<body>
	<%
		String del = request.getParameter("del");
		int i = Integer.parseInt(request.getParameter("a"));
		for (int j = 0; j <= i; j++) {
			String book = (String) session.getAttribute("b" + Integer.toString(j));
			try {
				if (book.equals(del)) {
					session.removeAttribute("b" + Integer.toString(j));
				}
			} catch (Exception e) {
			}
		}
	%>
	<span id="jumpTo"></span>
	<script type="text/javascript">
		countDown(0, 'cart.jsp');
	</script>
</body>
</html>