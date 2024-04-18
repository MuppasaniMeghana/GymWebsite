<%@ page import="java.sql.*" %>
<%
	 String username = request.getParameter("uname");
     String password = request.getParameter("pwd");
 try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM signup WHERE username = ? AND password = ?");
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String fullName = rs.getString("username");
                out.println("<h2>Welcome, " + fullName + "</h2>");
                
                Cookie usernameCookie = new Cookie("username", username);
                
                response.addCookie(usernameCookie);
                
                response.sendRedirect("index.html");
            }
			else
			{
                out.println("<h3>Sorry! Username and password combination not found</h3>");
				out.println("<h3>please login with correct credentials <a href='login.html'>here</a>");
               
            }

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            
        }
    


%>
