<%@ page import="java.sql.*" %>
<%
        Cookie[] cookies = request.getCookies();

        int flag = 0;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Checking for the "username" cookie
                if (cookie.getName().equals("username")) {
                    String username = cookie.getValue();
                    // Assuming "-19800000" is not a valid username, which is used as a placeholder for no username
                    if (!username.equals("-19800000")) {
                        flag = 1;
                        out.println("<h2>Hi, " + username + "! Welcome to your Profile!</h2>");
                    }
                    break; // No need to continue looping once the username cookie is found
                }
            }
        }

        if (flag == 0) {
            out.println("<h3>Please login first.</h3>");
            out.println("<h3><a href='login.html'>Login Here</a></h3>");
            out.close();
		}
            
        
    
%>
