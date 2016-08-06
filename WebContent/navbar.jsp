<!-- Navbar for user pages -->

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
		<%
			Connection conn=DBConnection.getConnection();

 		 	PreparedStatement pstmt=conn.prepareStatement("SELECT genreName FROM genre");

 		 	ResultSet rs=pstmt.executeQuery();
		%>
	<!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav sliding-u-l-r ">
        <li><a href="allGames.jsp" role="button">All Games</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Genre <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <% while(rs.next()){ %>
            <li><a href="displaySearch.jsp?search=<%=rs.getString("genreName")%>"><%=rs.getString("genreName")%></a></li>
          <% }conn.close(); %>
          </ul>
        </li>
        
      </ul>			
      
			<form class="navbar-form navbar-right navbar-searchbar" role="search" action="displaySearch.jsp">
				<div class="form-group">
					<input type="text" class="form-control" name="search" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<%if(session.getAttribute("userDetails")==null){ %>
			<ul class="nav navbar-nav navbar-right sliding-u-l-r">				
				<li><a href="register.jsp"><b>Register</b></a></li>				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
						 	<div class="row">
								<div class="col-md-12">
									 <form class="form" role="form" method="post" action="verifyUser.jsp" accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												 <!-- <label class="sr-only" for="exampleInputUser2">Email address</label> -->
												 <input type="email" class="form-control" id="exampleInputUser2" name="email" placeholder="Email" required>
											</div>
											<div class="form-group">
												 <!-- <label class="sr-only" for="exampleInputPassword2">Password</label> -->
												 <input type="password" class="form-control" id="exampleInputPassword2" name="userpwd" placeholder="Password" required>
											</div>
											<div class="form-group">
												 <button type="submit" class="btn btn-primary btn-block">Sign in</button>
											</div>
											
									 </form>
								</div>
						 	</div>
						</li>
					</ul>
				</li>
			</ul>
			<%}else{ %>
			<ul class="nav navbar-nav navbar-right sliding-u-l-r">								
				<li class="dropdown">
     			     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome <%= session.getAttribute("username") %><span class="caret"></span></a>
       			   <ul class="dropdown-menu">
        			    <li><a href="viewProfile.jsp">View Profile</a></li>
        			    <li><a href="cart.jsp">Shopping Cart</a></li>
        			    <li><a href="logout.jsp">Logout</a></li>
        			</ul>
       			 </li>
			</ul>
			<%} %>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> 
	</nav>