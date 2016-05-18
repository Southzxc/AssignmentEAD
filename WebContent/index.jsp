<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<title>SP Games Store</title>
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
        <li><a href="allGames.jsp" role="button">Games</a></li>
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


SLIDE SHOW MAYBE

<div class="container col-lg-8 col-lg-offset-2">
  <h2>SP Games Store</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Popular</a></li>
    <li><a data-toggle="tab" href="#menu1">Newly Added</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Popular</h3>
      <%	Class.forName("com.mysql.jdbc.Driver");

 	 		String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

  			Connection conn =   DriverManager.getConnection(connURL);

 		 	PreparedStatement pstmt=conn.prepareStatement("SELECT g.gameID, title, price, description, imageLocation from games g,games_genre gg where g.gameID=gg.gameID and genreID=41");

 		 	ResultSet rs=pstmt.executeQuery();

 		 	%>
 		 	<%while(rs.next()) { %>
 		 	
  				<div class="col-sm-6 col-md-4">
   					 <div class="thumbnail">
    					  <img src="<%=rs.getString("imageLocation") %>" alt="...">
     					 <div class="caption">
     					    <h3><%=rs.getString("title") %></h3>
      						<p><%=rs.getString("description") %></p>
     					    <p>$<%=rs.getDouble("price") %></p>
      					    <p><a href="#" class="btn btn-primary" role="button">Buy Now</a> <a href="gameDetails.jsp?gameID=<%=rs.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
    				     </div>
 				     </div>
 				 </div>
			<%} rs.close();%>
			
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Newly Added</h3>
       <%	
 		 	PreparedStatement newGame=conn.prepareStatement("SELECT gameID, title, price, description, imageLocation from games ORDER BY gameID desc LIMIT 9");

 		 	ResultSet game=newGame.executeQuery();

 		 	%>
 		 	<%while(game.next()) { %>
 		 	
  				<div class="col-sm-6 col-md-4">
   					 <div class="thumbnail">
    					  <img src="<%=game.getString("imageLocation") %>" alt="...">
     					 <div class="caption">
     					    <h3><%=game.getString("title") %></h3>
      						<p><%=game.getString("description") %></p>
     					    <p>$<%=game.getDouble("price") %></p>
      					    <p><a href="#" class="btn btn-primary" role="button">Buy Now</a> <a href="gameDetails.jsp?gameID=<%=game.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
    				     </div>
 				     </div>
 				 </div>
			<%} %> 
    </div>
  </div>
</div>
<%@include file="footer.html" %>
</body>
</html>