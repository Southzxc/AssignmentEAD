<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="header.html" %>   
	<title>SP Games Store</title>
</head>
<body>

	<%@include file="navbar.jsp" %>
		
	<div class="container col-lg-8 col-lg-offset-2">
	<%if(session.getAttribute("errorMsg") != null){ %>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	 	<strong>Error:</strong> <%=session.getAttribute("errorMsg") %>
	</div>
	
	<%
	session.removeAttribute("errorMsg");
	}%>	
	<!-- Home page carousel -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		 <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
			  </ol>
	
	  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="./image/VideoGamesbanner.jpg" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="./image/fallout4banner.jpg" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="./image/game.jpg" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="./image/car.jpg" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="./image/crysis3.jpg" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
		      <div class="carousel-caption">
		      </div>
		    </div>
		  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	<!-- End of carousel -->


	
  <h2>Welcome to SP Games Store!</h2>
	  <!-- Dynamic tabs -->
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">Popular</a></li>
	    <li><a data-toggle="tab" href="#menu1">Newly Added</a></li>
	  </ul>
	  
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
	      <h3>Popular</h3>
	      <%	
	      		conn=DBConnection.getConnection();
	
	 		 	pstmt=conn.prepareStatement("SELECT g.gameID, title, price, description, imageLocation, preOwned, company from games g,games_genre gg where g.gameID=gg.gameID and genreID=41");
	
	 		 	rs=pstmt.executeQuery();
	
	 		 	%>
	 		 	<!-- Display game information for popular -->
	 		 	<%while(rs.next()) { %>
	 		 	
	  				<div class="col-sm-6 col-md-4">
	   					 <div class="thumbnail">
	    					  <img src="<%=rs.getString("imageLocation") %>" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
	     					 <div class="caption">
	     					    <h3><%=rs.getString("title") %></h3>
	      						<p><%=rs.getString("description") %></p>
	     					    <p>$<%out.println(String.format("%.2f", rs.getDouble("price"))); %></p>
	     					    <%if(session.getAttribute("userDetails")!=null){ %>
	      					    <form action="addToCart">
	      					    <input type="hidden" name="gameID" value="<%=rs.getInt("gameID")%>">
	      					    <input type="hidden" name="title" value="<%=rs.getString("title") %>">
	      					    <input type="hidden" name="company" value="<%=rs.getString("company") %>">
	      					    <input type="hidden" name="price" value="<%=rs.getDouble("price") %>">
	      					    <input type="hidden" name="imageLocation" value="<%=rs.getString("imageLocation") %>">
	      					    <input type="hidden" name="preOwned" value="<%=rs.getString("preOwned") %>">
	      					    <input type="hidden" name="quantity" value="1">
	      					    <input type="submit" value="Buy Now" class="btn btn-primary" role="button"></form>
	      					    <%} else { %>
	      					    <p><a href="#" class="btn btn-primary" role="button" hidden="<%=rs.getInt("gameID")%>">Buy Now</a><%} %>
	      					    <a href="gameDetails.jsp?gameID=<%=rs.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
	    				     </div>
	 				     </div>
	 				 </div>
				<%} 
	 		 	rs.close();%>
				
	    </div>
	    <div id="menu1" class="tab-pane fade">
	      <h3>Newly Added</h3>
	       <%	
	 		 	PreparedStatement newGame=conn.prepareStatement("SELECT gameID, title, price, description, imageLocation from games ORDER BY gameID desc LIMIT 9");
	
	 		 	ResultSet game=newGame.executeQuery();
	
	 		 	%>
	 		 	<%while(game.next()) { %>
	 		 		
	 		 		<!-- Display game info for newly added -->
	  				<div class="col-sm-6 col-md-4">
	   					 <div class="thumbnail">
	    					  <img src="<%=game.getString("imageLocation") %>" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
	     					 <div class="caption">
	     					    <h3><%=game.getString("title") %></h3>
	      						<p><%=game.getString("description") %></p>
	     					    <p>$<%out.println(String.format("%.2f", game.getDouble("price"))); %></p>
	      					    <p><form action="addToCart"><a href="#" class="btn btn-primary" role="button" hidden="<%=game.getInt("gameID")%>">Buy Now</a></form> <a href="gameDetails.jsp?gameID=<%=game.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
	    				     </div>
	 				     </div>
	 				 </div>
	 				 
	 				 
				<%} 
				  game.close();%> 
	
	    </div>
	  </div>
	  <!-- End of dynamic tabs -->
	</div>
<%@include file="footer.html" %>
</body>
</html>