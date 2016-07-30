<%
if(session.getAttribute("userDetails") == null){
	response.sendRedirect("unauthorised.jsp");
}else{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*, db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<title>Update your profile</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%UserModel userDetails = (UserModel)session.getAttribute("userDetails"); %>
	<%=userDetails.getUsername() %>
	<%=userDetails.getAddress() %>
	<%=userDetails.getContact() %>
</body>
</html>
<%}%>