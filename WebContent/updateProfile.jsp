<%
if(session.getAttribute("userDetails") == null){
	session.setAttribute("errorMsg", "Please login to view the page");
	response.sendRedirect("index.jsp");
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
	<div class="container">
		<%if(session.getAttribute("success") != null){%>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success!</strong> <%=session.getAttribute("success") %>
			</div>			
		<%}
		session.removeAttribute("success");
		%>
		
		<%if(session.getAttribute("errorMsg") != null){%> 
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Error:</strong> <%=session.getAttribute("errorMsg") %>
			</div>			
		<%}
		session.removeAttribute("errorMsg");
		%>
		<ol class="breadcrumb">
			<li><a href="viewProfile.jsp">Profile page</a></li>
			<li class="active">Update profile</li>
		</ol>
		<h1 class="page-header">
			Update your profile
		</h1>
		<div class="col-lg-8 col-lg-offset-2">		
			<div class="panel panel-default">
			<div class="panel-heading">Update Details</div>
				<div class="panel-body">
					<form id="updateForm" class="form-horizontal" action="UpdateProfileController">
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="username">Username</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="username" name="username" placeholder="User name" value = "<%=userDetails.getUsername()%>"/>
							</div>						
						</div>
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="address">Address</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="address" name="address" placeholder="Address" value = "<%=userDetails.getAddress()%>"/>
							</div>					
						</div>
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="email">Email</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email" value = "<%=userDetails.getEmail()%>"/>
							</div>					
						</div>
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="contact">Contact No.</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="contact" name="contact" placeholder="contact" value = "<%=userDetails.getContact()%>"/>
							</div>						
						</div>
						<div class="form-group">
							<div class="col-sm-3 col-sm-offset-2">
							<button type="submit" class="btn btn-primary" name="updateProfile" value="updateProfile">Update</button>
							</div>						
						</div>
					</form>										
				</div>
			</div>
			<div class="panel panel-default">
			<div class="panel-heading">Update Password</div>
				<div class="panel-body">
					<form id="updateForm" method="post" class="form-horizontal" action="UpdateProfileController">
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="password">Current password</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="password" name="password" placeholder="Current password"/>
							</div>						
						</div>
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="npassword">New password</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="npassword" name="npassword" placeholder="New password"/>
							</div>					
						</div>
					  	<div class="form-group">
							<label class="col-sm-2 control-label" for="password">Confirm password</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="cfpassword" name="cfpassword" placeholder="Confirm password"/>
							</div>						
						</div>
						<div class="form-group">
							<div class="col-sm-3 col-sm-offset-2">
							<button type="submit" class="btn btn-primary" name="updateProfile" value="updateProfile">Update</button>
							</div>						
						</div>						
					</form>										
				</div>
			</div>
		</div>
	</div>		
</body>
</html>
<%}%>