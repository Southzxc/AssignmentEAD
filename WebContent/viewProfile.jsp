<%
if(session.getAttribute("userDetails") == null){
	session.setAttribute("errorMsg", "Please login to view the page");
	response.sendRedirect("index.jsp");
}else{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "db.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<title>View Profile</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%UserModel userDetails = (UserModel)session.getAttribute("userDetails");%>
	<div class="container">
		<ol class="breadcrumb">
		    <li class="active">Profile page</a></li>
		</ol>
		<div class="col-lg-8 col-lg-offset-2">
			<div class="panel panel-default">
				<div class="panel panel-heading" style="margin-bottom:3px">
				Your profile
				</div>
				<div class="panel-body" style="padding-top:0px">
					<table class="table">
						<tbody>
							<tr>
								<td>Username</td>
								<td><%=userDetails.getUsername() %></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><%=userDetails.getAddress() %></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><%=userDetails.getEmail() %></td>
							</tr>
							<tr>
								<td>Contact</td>
								<td><%=userDetails.getContact() %></td>
							</tr>
						</tbody>
					</table>
					<a href="updateProfile.jsp" class="btn btn-primary" role="button">Update profile</a>
					<a href="purchaseHistory.jsp" class="btn btn-primary" role="button">See purchase history</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%}%>