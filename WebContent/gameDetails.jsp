<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.3.min.js"></script>
<!--JQUERY PLUGIN FOR STARS RATING -->
<link rel="stylesheet" href="css/jquery.rating.css"> 
<script src="js/jquery.rating.pack.js"></script> 

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
<link type="text/css" rel="stylesheet" media="screen"href="css/home.css" />
<link type="text/css" rel="stylesheet" media="screen" href="css/bootstrap-multiselect.css" />

<title>Vapour Store</title>
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
					<input type="text" class="form-control" placeholder="Search">
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
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Shop Name</p>
                <div class="list-group">
                    <a href="#" class="list-group-item active">Category 1</a>
                    <a href="#" class="list-group-item">Category 2</a>
                    <a href="#" class="list-group-item">Category 3</a>
                </div>
            </div>

            <div class="col-md-9">
            
      <%	
      		String gameID=request.getParameter("gameID");
      	
      		Class.forName("com.mysql.jdbc.Driver");

 	 		String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

  			Connection conn =   DriverManager.getConnection(connURL);

 		 	PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM games where gameID = ?");

 		 	pstmt.setString(1,gameID);
 		 	
 		 	ResultSet rs=pstmt.executeQuery();
			
 		 	rs.next();
 		 	%>
 		 	
                <div class="thumbnail">
                    <img class="img-responsive" src="<%=rs.getString("imageLocation") %>" alt="">
                    <div class="caption-full">
                        <h4 class="pull-right">$<%=rs.getDouble("price") %></h4>
                        <h4><%=rs.getString("title") %></h4>
                        <p>Company: <%=rs.getString("company") %></p>
                        <%
                        pstmt=conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
                        pstmt.setString(1, gameID); 
                        ResultSet displayGenre = pstmt.executeQuery();
                        %>
                        <p>
                        Genre<br>
                       <% while(displayGenre.next()){ %>
                        <span class="label label-info"><%=displayGenre.getString("genreName") %></span>   
                        <% } %>
                        </p>
                        <p>Description<br><%=rs.getString("description") %></p>
                    </div>
                            
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

				
				<%if(rs.getString("preOwned").equals("No")){ %>
                <div class="well">
					<div class="col-lg-10 col-lg-offset-1">
						<!-- Add game form -->
						<h2>Reviews & Comments</h2>
						<form id="gameForm" method="post" action="addComment.jsp?gameID=<%=rs.getInt("gameID")%>">				    			    
						    						    
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-6 ">
						                <label class="control-label">Commenter Name:</label>
						                <input type="text" class="form-control" name="commentName" />
						            </div>				            
						        </div>
						    </div>
							
							<div class="form-group">
						        <div class="row">
						            <div class="col-xs-4 ">
						                <input type="radio" name="rating" value="1" class="star">
           								<input type="radio" name="rating" value="2" class="star">
          								<input type="radio" name="rating" value="3" class="star">
          								<input type="radio" name="rating" value="4" class="star">
           								<input type="radio" name="rating" value="5" class="star">
						            </div>				            
						        </div>
						    </div>
							
            				
						    <div class="form-group">
						    	<div class="row">
						    	<div class="col-xs-8">
						        <label class="control-label">Comments:</label>
						        <textarea class="form-control" name="comment" rows="8"></textarea>
						        </div>
						        </div>
						    </div>
						
								<div class="text-right">
                   			     <button type="submit" class="btn btn-success">Leave a Review</button>
                   			     
                   			 </div>
						</form>

                    </div>


                    <hr>
                    
                    <%pstmt=conn.prepareStatement("SELECT name, date, comment, rating from comment where gameID=?");
                      
                      pstmt.setString(1, gameID);
                    
                      ResultSet displayComment=pstmt.executeQuery();
                      
                      while(displayComment.next()) {%>

                    <div class="row">
                        <div class="col-md-12">
                            <span class="pull-right"><%=displayComment.getDate("date") %></span>
                            <p>Name: <%=displayComment.getString("name") %></p><p>Rating: <%=displayComment.getInt("rating") %>/5</p>
                            <p>Comment: <%=displayComment.getString("comment") %></p>
                        </div>
                    </div>

                    <hr>
					<%}
                      } else
                    	  out.println("No Comments");
                      		%>
                    

                </div>

            </div>

        </div>

    </div>

    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

</body>

</html>
