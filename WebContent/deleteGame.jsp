<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String gameID = request.getParameter("gameID");

try{
	Class.forName("com.mysql.jdbc.Driver");

	String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

	Connection conn =   DriverManager.getConnection(connURL);

	PreparedStatement pstmt=conn.prepareStatement("DELETE from games WHERE gameID=?");

	pstmt.setString(1, gameID);

	pstmt.executeUpdate();

	conn.close();

	response.sendRedirect("adminHomePage.jsp");
}catch(Exception e){
	out.println(e); //remember to change to error message when submitting
}

%>

</body>
</html>