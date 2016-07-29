<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*,controller.*, model.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="header.html" %>   
	<title>SP Games Store</title>
</head>
<body>
	<%
	if(session.getAttribute("user")!=null/* cookies!=null */){
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		/* for (Cookie cookie : cookies) {
		       if (cookie.getName().equals("c1")) {
		           name=cookie.getValue();
		       }
		       if(cookie.getName().equals("c2")){
		           pass=cookie.getValue();
		       }
		    } */
		%>
		<%@include file="loginNavbar.jsp" %>
		
		<%
		if(resultsList == null) {%>
			Nothing in cart
		<%
		}
		
		for(shoppingCart shops:resultsList){
		%>
		<%=shops.getTitle() %><br />
		<%
		}
		%>
		
		
		<%} else {
		response.sendRedirect("unauthorised.jsp");
		}%>
</body>
</html>