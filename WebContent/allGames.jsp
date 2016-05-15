<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.3.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
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
<title>Insert title here</title>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top navbar-border ">
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
			<a class="navbar-brand" href="index.jsp">SP Games Store</a>
		</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav sliding-u-l-r ">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Platforms<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">PC</a></li>
            <li><a href="#">XBOX</a></li>
            <li><a href="#">NINTENDO</a></li>
            <li><a href="#">WII U</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Genre <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Adventure</a></li>
            <li><a href="#">Casual</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Popular Tags</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Discount</a></li>
          </ul>
        </li>
      </ul>			
			<form class="navbar-form navbar-right navbar-searchbar" role="search" action="displaySearch.jsp">
				<div class="form-group">
					<input type="text" class="form-control" name="search" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right sliding-u-l-r">
				<li><p class="navbar-text">Already have an account?</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
					 <div class="row">
							<div class="col-md-12">
								 <form class="form" role="form" method="post" action="verifyUser.jsp" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <!-- <label class="sr-only" for="exampleInputUser2">Email address</label> -->
											 <input type="text" class="form-control" id="exampleInputUser2" name="username" placeholder="Username" required>
										</div>
										<div class="form-group">
											 <!-- <label class="sr-only" for="exampleInputPassword2">Password</label> -->
											 <input type="password" class="form-control" id="exampleInputPassword2" name="userpwd" placeholder="Password" required>
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
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> 
	</nav>
	
		<%
			String search = request.getParameter("search");
															 
			Class.forName("com.mysql.jdbc.Driver");
	
			String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 
	
			Connection conn =   DriverManager.getConnection(connURL);
	
			PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM games");
															
			ResultSet rs=pstmt.executeQuery();	

		%>
		
		<!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">All Games</h1>
            </div>
        </div>
        <!-- /.row -->
		<%while(rs.next()){ %>
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="<%=rs.getString("imageLocation") %>" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3><%=rs.getString("title") %></h3>
                <%
                String gameID = rs.getString("gameID");
                pstmt=conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
                pstmt.setString(1, gameID); 
                ResultSet displayGenre = pstmt.executeQuery();
                %>                
                <h4>
                <%
                while(displayGenre.next()){%>
                	<span class="label label-info"><%=displayGenre.getString("genreName") %></span>
                <%}
                %>
                </h4>
                <p><%=rs.getString("description") %></p>
                <a class="btn btn-primary" href="gameDetails.jsp?gameID=<%=rs.getInt("gameID")%>">View Game <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        <%} %>	
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</body>
</html>