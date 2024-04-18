<%@ page import="java.sql.*" %>
<%
try {
    // Declare and initialize variables
    

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","oracle");
	String qry = "select * from signup";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(qry);
    out.print("<table border=3 cellpadding=10 align='center'>");
	out.print("<tr>");
	out.print("<th>" +"username"+"</th>");
	out.print("<th>" +"email"+"</th>");		
	out.println("<th>"+"phno"+"</th>");
	out.print("<th>" +"password"+"</th>");
					
	out.print("</tr>");
				
	while(rs.next())
	{
					//out.print("<table>");
					
					out.print("<tr>");
					out.print("<td>"+rs.getString(1)+"</td>");
					out.print("<td>" +rs.getString(2)+"</td>");
					out.print("<td>" +rs.getLong(3)+ "</td>");
					out.print("<td>" +rs.getString(4)+ "</td>");
					
					out.print("</tr>");

					out.print("</tr>");

					//out.print("</table>");
						
	}
				out.print("</table>");
				 
    
	} 
	catch (Exception e) 
	{
					out.print("Error: " + e.getMessage());
	}
%>
