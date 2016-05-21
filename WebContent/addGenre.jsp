<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Page</title>
</head>
<body>

<!-- JSP + SQL for inserting genre -->
<%
String genre = request.getParameter("genre");

try{
	Connection conn=DBConnection.getConnection();

	PreparedStatement pstmt=conn.prepareStatement("INSERT into genre(genreName)  VALUES(?)");

	pstmt.setString(1, genre);

	pstmt.executeUpdate();

	conn.close();
}catch(Exception e){
	out.println(e);
}

response.setHeader("Refresh", "2;url=adminHomePage.jsp");

%>
GENRE ADDED redirecting in 2 seconds
</body>
</html>