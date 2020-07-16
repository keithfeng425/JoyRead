package final_design;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginVerify
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

	static final String USER = "root";
	static final String PASS = "123456";

	public Register() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		Statement stat = null;
		Statement stmt = null;
		response.setContentType("text/html;charset=UTF-8");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stat = conn.createStatement();
			stmt = conn.createStatement();

			String username = null;
			String nickname = null;
			String password = null;
			String age = null;
			String gender = null;
			String phone = null;

			username = request.getParameter("username");
			nickname = request.getParameter("nickname");
			password = request.getParameter("password");
			age = request.getParameter("age");
			gender = request.getParameter("gender");
			phone = request.getParameter("phone");

			String sql;

			sql = "select * from user where username='" + username + "' or nickname='" + nickname + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				String site = new String("regfailed.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}

			else {
				sql = "insert into user values('" + username + "','" + password + "','" + nickname + "','" + age + "','"
						+ gender + "','" + phone + "')";
				stat.executeUpdate(sql);

				HttpSession session = request.getSession();
				session.setAttribute("loginuser", nickname);

				String site = new String("regsuccess.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}

			stat.close();
			conn.close();
		} catch (Exception e) {
			String site = new String("error404.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
