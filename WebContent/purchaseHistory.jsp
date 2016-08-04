<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "db.*, java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file = "header.html" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase History</title>
</head>
<body>
	<%@include file = "navbar.jsp" %>
	<%ArrayList<PurchasesHistoryModel> displayPDetails = (ArrayList<PurchasesHistoryModel>)session.getAttribute("displayPDetails");
	for(PurchasesHistoryModel pDetails : displayPDetails){
		out.print(pDetails.getTitle());
		out.print(pDetails.getQuantity());
		out.print(pDetails.getPrice());
		out.print(pDetails.getDate());
	%>
	<br>
	<%} %>
</body>
</html>