<%@ page import="java.sql.*" %>
<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Statement st = con.createStatement();
    ResultSet rs;

    rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    
    if (rs.next()) {
        String userTypeFromDB = rs.getString("type"); // retrieve user type from the database

        session.setAttribute("user", userid); // the username will be stored in the session

        if ("customer".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("CustomerHome.jsp");
        } else if ("representative".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("representativeUI.jsp");
        } else if ("admin".equals(userTypeFromDB)) {
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("adminUI.jsp");
        } else {
            // Handle unknown user types
            out.println("Unknown user type");
        }

        out.println("<a href='logout.jsp'>Log out</a>");
        //response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
