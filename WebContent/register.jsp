<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="header.html" %>
	<script type = "text/javascript" src="js/jquery.validate.min.js"></script>
	<title>Registration</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container">
		<div class="row">
		<%if(session.getAttribute("errorMsg") != null){ %>
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Error:</strong> <%= session.getAttribute("errorMsg") %>
			</div>
		<%
		session.removeAttribute("errorMsg");
		}%>
					
			<div class="panel panel-default">			
				<div class="panel-heading">
					<h3 class="panel-title">Registration Form</h3>
				</div>
				<div class="panel-body">
					<form id="signupForm" method="post" class="form-horizontal" action="RegisterController">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="username">Username</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="username" name="username" placeholder="User name" />
							</div>
						</div>
		
						<div class="form-group">
							<label class="col-sm-4 control-label" for="address">Address</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="address" name="address" placeholder="Mailing Address" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="email">Email</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="contact">Contact No.</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="contact" name="contact" placeholder="Contact No." />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="password">Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="password" name="password" placeholder="Password" />
							</div>
						</div>
		
						<div class="form-group">
							<label class="col-sm-4 control-label" for="confirm_password">Confirm password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm password" />
							</div>
						</div>
		
						<div class="form-group">
							<div class="col-sm-5 col-sm-offset-4">
								<div class="checkbox">
									<label>
										<input type="checkbox" id="agree" name="agree" value="agree" />Please agree to our policy
									</label>
								</div>
							</div>
						</div>
		
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4">
								<button type="submit" class="btn btn-primary" name="signup" value="Sign up">Sign up</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		jQuery.validator.addMethod("alphanumeric", function(value, element) {
		  return this.optional(element) || /^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d])|(?=.*\d))|(?=.*[A-Z])(?=.*\d)).{8,16}$/.test(value);
		}, "Please provide a password that has numbers and alphabets that is at least 8 characters long");
	
		/* $.validator.setDefaults( {
			submitHandler: function () {
				alert( "submitted!" );
			}
		} ); */

		$( document ).ready( function () {
			$( "#signupForm" ).validate( {
				rules: {
					username: "required",					
					password: {
						required: true,
						alphanumeric: true,
						
					},
					confirm_password: {
						required: true,
						alphanumeric:true,
						equalTo: "#password"
					},
					address: {
						required: true
					},
					email: {
						required: true,
						email: true
					},
					contact: {
						required: true,
						digits: true,
						maxlength: 8,
						minlength: 8
					},
					agree: "required"
				},
				messages: {
					username: "Please enter your username",
					password: {
						required: "Please provide a password",
						alphanumeric: "Please provide a password with numbers and alphabets that is at least 8 characters long",
					},
					confirm_password: {
						required: "Please provide a password",
						alphanumeric: "Please provide a password with numbers and alphabets that is at least 8 characters long",
						equalTo: "Please enter the same password as above"
					},
					address:"Please enter your mailing address",
					email: "Please enter a valid email address",
					contact:"Please enter a 8 digit contact number",
					agree: "Please accept our policy"
				},
				errorElement: "em",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					if ( element.prop( "type" ) === "checkbox" ) {
						error.insertAfter( element.parent( "label" ) );
					} else {
						error.insertAfter( element );
					}
				},
				highlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
				},
				unhighlight: function (element, errorClass, validClass) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
				}
			} );
		} );
	</script>
<%@include file="footer.html" %>		
</body>
</html>