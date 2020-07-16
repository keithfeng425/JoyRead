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
 * Servlet implementation class UserEdit
 */
@WebServlet("/UserEdit")
public class UserEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/final?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

	static final String USER = "root";
	static final String PASS = "123456";

	public UserEdit() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;
		Statement stat = null;
		response.setContentType("text/html;charset=UTF-8");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stat = conn.createStatement();

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
			ResultSet rs = stat.executeQuery(sql);

			rs.last();
			int rowCount = rs.getRow();

			if (rowCount > 1) {
				String site = new String("editfailed.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}

			else {
				sql = "update user set username = '" + username + "', password = '" + password + "', nickname = '"
						+ nickname + "', age = '" + age + "', gender = '" + gender + "', phone = '" + phone
						+ "' where nickname = '" + nickname + "'";
				System.out.println(sql);
				stat.executeUpdate(sql);

				HttpSession session = request.getSession();
				session.setAttribute("loginuser", nickname);

				String site = new String("editsuccess.jsp");
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
