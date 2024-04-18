<%@ page import="java.sql.*" %>
<%
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        long phno=Long.parseLong(request.getParameter("phno"));
		
        

        String message = request.getParameter("message");

        try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle");
				String qry = "insert into contact values(?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(qry);
				
				pst.setString(1,username);
				pst.setString(2,email);
				pst.setLong(3,phno);
				pst.setString(4,message);
				
				pst.executeUpdate();
				
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Submitted Successfully');");
				out.println("</script>");

				con.close();
				
	
			}
			catch (Exception e)
			{
				out.print(e);
			}
			
		

%>