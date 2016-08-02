<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file = "header.html" %>
<title>Unauthorised</title>
</head>
<body>
<%@include file = "navbar.jsp" %>
<%response.setHeader("Refresh", "2;url=index.jsp"); %>
<div class = "container">
	<h1>Sorry, you are not allowed to view this page, redirecting to homepage</h1>
</div>
</body>
</html>