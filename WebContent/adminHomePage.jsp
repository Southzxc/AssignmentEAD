<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.3.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">


<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" media="screen"
	href="css/home.css" />
<title>Administrator Page</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-border ">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">VAPOUR</a>
		</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav sliding-u-l-r ">
        <li><a href="#">link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">link</a></li>
        <li><a href="#">link</a></li>
        <li><a href="#">link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Genre <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Add genre</a></li>
            <li><a href="#">Update/Remove genre</a></li>
            <li><a href="#">link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">link</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Games <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Add game</a></li>
            <li><a href="#">Update/Remove games</a></li>
            <li><a href="#">link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">link</a></li>
          </ul>
        </li>
      </ul>			
			<form class="navbar-form navbar-right navbar-searchbar" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right sliding-u-l-r">
				<li><p class="navbar-text">Welcome back, admin!</li>
				<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
					 <div class="row">
							<div class="col-md-12">
								 <form class="form" role="form" method="post" action="verifyUser.jsp" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputUser2">Email address</label>
											 <input type="text" class="form-control" id="exampleInputUser2" name="user" placeholder="Username" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" class="form-control" id="exampleInputPassword2" name="password" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="">Forget the password ?</a></div>
										</div>
										<div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Sign in</button>
										</div>
										<div class="checkbox">
											 <label>
											 <input type="checkbox"> keep me logged-in
											 </label>
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="#"><b>Join Us</b></a>
							</div>
					 </div>
				</li>
					</ul>
				</li> -->
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
</body>
</html>