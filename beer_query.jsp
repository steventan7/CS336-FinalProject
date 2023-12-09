<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String sort = request.getParameter("sort");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "";
			
			String[] selectedValues = request.getParameterValues("filter");
			int n = selectedValues.length;

			String filters = "";
			for (int i = 0; i < selectedValues.length; i++) {
				filters += selectedValues[i];
				
				if (i < selectedValues.length - 1) {
					filters += ", ";
				} 
			}
			
			if (!sort.equals("all")) {
				if(!filters.equals("none")) {
					str = "SELECT " + filters + " FROM sells ORDER BY " + sort;
				} else {
					str = "SELECT * FROM sells ORDER BY " + sort;
				}
			}
			if (sort.equals("all") || (n >= 2 && selectedValues[0].equals("none"))) {
				str = "SELECT * FROM sells";
			}
			
			//Run the query against the database.ORDER BY column1 ASC; 
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table style=\"padding: 20px\" id=\"flightTable\">");
			
			//make a row
			if (filters.equals("none")) {
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//print out column header
				out.print("bar");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print("beer");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print("price");
				out.print("</td>");
			} else {
				out.print("<tr>");
				for (int i = 0; i < selectedValues.length; i++) {
					out.print("<td>");
					out.print(selectedValues[i]);
					out.print("</td>");
				}
			}
			

			//parse out the results
			while (result.next()) {
				//make a row
				if (filters.equals("none")) {
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("bar"));
					out.print("</td>");
					out.print("<td>");
					//Print out current beer name:
					out.print(result.getString("beer"));
					out.print("</td>");
					out.print("<td>");
					//Print out current price
					out.print(result.getString("price"));
					out.print("</td>");
				} else {
					out.print("<tr>");
					for (int i = 0; i < selectedValues.length; i++) {
						out.print("<td>");
						out.print(result.getString(selectedValues[i]));
						out.print("</td>");
					}
				}
			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>
