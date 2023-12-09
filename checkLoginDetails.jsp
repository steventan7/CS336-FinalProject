<%@ page import ="java.sql.*" %>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String usertype = request.getParameter("type");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BarBeerDrinkerSample","root",
	"Polarbears123!");
	Statement st = con.createStatement();
	ResultSet rs;
	/* rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd
	+ "'" + "' and usertype='" + usertype + "'"); */
	rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "' and type='" + usertype + "'");

	if (rs.next()) {
		session.setAttribute("user", userid); // the username will be stored in the session
		
		String userTypeFromDB = rs.getString("usertype"); //get usertype 
		
		if ("customer".equals(usertype)) {
			out.println("<a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("customerUI.jsp");
	    } else if ("customer-representative".equals(userTypeFromDB)) {
	    	out.println("<a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("representativeUI.jsp");
	    } else if ("admin".equals(userTypeFromDB)) {
	    	out.println("<a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("adminUI.jsp");
	    } else {
	        // Handle unknown user types
	        out.println("Unknown user type");
	    }
		
		
		/* out.println("welcome " + userid); */
		out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("success.jsp");
	} else {
		out.println("Invalid password <a href='login.jsp'>try again</a>");
	}
%> 
