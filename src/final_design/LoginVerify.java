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
@WebServlet("/LoginVerify")
public class LoginVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/final?useSSL=false";
    
    static final String USER = "root";
    static final String PASS = "123456";
	

    public LoginVerify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
        Statement stmt = null;
		response.setContentType("text/html;charset=UTF-8");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            String username = request.getParameter("username");
			String password = request.getParameter("password");
			String save = request.getParameter("save");
			System.out.print(save);
			String nickname = null;
            String sql = "select nickname from user where username='"+username+"' and password='"+password+"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            	if (rs.next()) {
            		nickname = rs.getString(1);
					HttpSession session = request.getSession();
					session.setAttribute("loginuser", nickname);
    				if (save != null) {
    					Cookie c1 = new Cookie("cusername", username);
    					Cookie c2 = new Cookie("cpassword", password);
    					response.addCookie(c1);
    					response.addCookie(c2);	
    				}
    				else {
    					Cookie c[] = request.getCookies();
    					try {
    						for (int i = 0; i < c.length; i++) {
    							if ("cusername".equals(c[i].getName())) {
    								c[i].setMaxAge(0);
    	    						response.addCookie(c[i]);
    							}
    							if ("cpassword".equals(c[i].getName())) {
    								c[i].setMaxAge(0);
    	    						response.addCookie(c[i]);
    							}
    						}
    					}
    					catch (Exception e) { }
    				}
    				String site = new String("loginsuccess.jsp");
    	            response.setStatus(response.SC_MOVED_TEMPORARILY);
    	            response.setHeader("Location", site); 
    			}
    			else {
    				System.out.print(username);
    				String site = new String("loginfailed.jsp");
    	            response.setStatus(response.SC_MOVED_TEMPORARILY);
    	            response.setHeader("Location", site); 
    			}
            
            rs.close();
            stmt.close();
            conn.close();
            if (rs!=null) {
				rs.close();
			}
        }
        catch (Exception e) { 
        	String site = new String("userlogin.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);  
        }
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
