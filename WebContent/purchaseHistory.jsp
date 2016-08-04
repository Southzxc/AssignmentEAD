<%
if(session.getAttribute("userDetails") == null){
	session.setAttribute("errorMsg", "Please login to view the page");
	response.sendRedirect("index.jsp");
}else{
%>
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
	<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="viewProfile.jsp">Profile page</a></li>
				<li class="active">Purchases history</li>
			</ol>		
			<h1 class="page-header">
			Purchases history
			</h1>
			<div class="table-responsive col-lg-10 col-lg-offset-1">
				<table class="table table-hover">
					<thead>
           				<tr>
           					<th>Title</th>
           					<th>Quantity</th>
           					<th>Total price</th>
           					<th>Date & Time purchased</th>
           				</tr>
                	</thead>
				<%ArrayList<PurchasesHistoryModel> displayPDetails = (ArrayList<PurchasesHistoryModel>)session.getAttribute("displayPDetails");
				if(displayPDetails != null){
					for(PurchasesHistoryModel pDetails : displayPDetails){%>
						<tbody>
							<tr>
								<td><%=pDetails.getTitle() %></td>
								<td><%=pDetails.getQuantity() %></td>
								<td><%=String.format("%.2f", pDetails.getPrice() * pDetails.getQuantity()) %></td>
								<td><%=pDetails.getDate() %></td>
							</tr>
						</tbody>
				<%	}
					displayPDetails = null;
				}else{
				response.sendRedirect("PurchasesHistoryController");
				}%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<%}%>