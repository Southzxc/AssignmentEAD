<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/* JSP + SQL statements to verify login abc*/

String username = request.getParameter("username");
String userpwd = request.getParameter("userpwd");
try{
	Connection conn=DBConnection.getConnection();
	
	PreparedStatement pstmt=conn.prepareStatement("SELECT username, userpwd FROM users WHERE username = ? and userpwd = ?");
			
	pstmt.setString(1, username);
			
	pstmt.setString(2, userpwd);
			
	ResultSet rs=pstmt.executeQuery();
			
	while(rs.next()){
		response.sendRedirect("adminHomePage.jsp");
	}
		
	response.setHeader("Refresh","2;url=index.jsp");
}catch(Exception e){
	out.println(e);
}
%>
Wrong Username or Password, redirecting back to homepage in 2 seconds
</body>
</html>