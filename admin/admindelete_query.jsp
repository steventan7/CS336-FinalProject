<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelReservation", "root", "Polarbears123!");


		Statement stmt = con.createStatement();
		
		String username = request.getParameter("dusername");
		String password = request.getParameter("dpassword");
 
		
      

		String delete = "DELETE FROM users WHERE username = ?";
	
		PreparedStatement ps = con.prepareStatement(delete);

		
		ps.setString(1, username);

		
	
		int deleted = ps.executeUpdate();

		
		con.close();
	
		if (deleted > 0) {
			out.print("Delete succeeded :)");
		} else {
			out.print("Delete failed :( Airport ID does not exist!");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Delete failed :()");
	}
%>
</body>
</html>