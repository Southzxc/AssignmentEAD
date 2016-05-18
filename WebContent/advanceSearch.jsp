<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<link type="text/css" rel="stylesheet" media="screen" href="css/bootstrap-multiselect.css" />
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
	
	<div class="col-lg-10 col-lg-offset-1">
						<!-- Add game form -->
						<h2>Search game</h2>
						<form id="gameForm" method="post" action="advanceSearchResult.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4 ">
						                <label class="control-label">Title</label>
						                <input type="text" class="form-control" name="gameTitle" />
						            </div>
						            <div class="col-xs-2 selectContainer">
						                <label class="control-label">Genre</label><br>
						                <select id = "chooseGenre" class="form-control" name="genre" >					
					<%
						try{
							Class.forName("com.mysql.jdbc.Driver");

							String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

							Connection conn =   DriverManager.getConnection(connURL);

							PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM genre");
							
							ResultSet rs=pstmt.executeQuery();
							
							while(rs.next()){ 
					%>						
						                    <option value="<%=rs.getInt("genreID")%>"><%=rs.getString("genreName")%></option>						                    						               							
					<%		}
					%>		
						                </select>
						            </div>											
					<%	}catch(Exception e){
						out.println(e);
					}
					
					%>	

						            <!-- Script for calling the drop down -->
									<script type="text/javascript">
									    $(document).ready(function() {
									        $('#chooseGenre').multiselect({
									        	includeSelectAllOption: true,
									        	nonSelectedText:'None',
									        	numberDisplayed: 1
									        });
									    });
									</script>
									
									
									<div class="col-xs-2 selectContainer">
									<label class="control-label">Preowned</label><br>
										<input type="radio" name="preOwned" value="Yes" checked>Yes
										<input type="radio" name="preOwned" value="No">No
									</div>											            
						        </div>
						    </div>
						
			

						
						    <button type="submit" class="btn btn-default">Search</button>
						</form>
						
						<!-- PAGE SEPARATOR -->
						<div class="container-liquid" >
						    <div class="row">
						        <div class="col-xs-12"><hr></div>
						        <hr>
						    </div>
						</div> 

						
                    </div>
           <%@include file="footer.html" %>
</body>
</html>