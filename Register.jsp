<%@ page import="java.sql.*" %>
<%

	String username = request.getParameter("Username");
    String email = request.getParameter("Email");
    long phno=Long.parseLong(request.getParameter("MobileNumber"));
		
        

	String password = request.getParameter("Password");

		

       
        try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle");
				String qry = "insert into signup values(?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(qry);
				
				pst.setString(1,username);
				pst.setString(2,email);
				pst.setLong(3,phno);
				pst.setString(4,password);
				
				pst.executeUpdate();
				out.print("<header>submitted successfully</header>");
				out.print("<br><a href='Display.jsp'>Click here to Display Data </a>");
				out.print("<br><a href='login.html'>Click here to login </a>");
				con.close();
	
			}
			catch (Exception e)
			{
				out.print(e);
			}
%>