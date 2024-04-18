
<%@ page import="java.sql.*" %>
<%

        
        // Get the existing username cookie, if it exists
        Cookie[] cookies = request.getCookies();
        Cookie usernameCookie = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    usernameCookie = cookie;
                    break;
                }
            }
        }
        
        // Delete the username cookie if it exists
        if (usernameCookie != null) {
            usernameCookie.setMaxAge(0);
            response.addCookie(usernameCookie);
        }
        
        // Redirect to the index page
		out.print("<h3>you are successfully logged out</h3>");
        out.print("<h3><a href='login.html'> you can relogin here </a></h3>");
        out.close();
%>