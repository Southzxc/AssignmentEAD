<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
SLIDE SHOW HERE
  <h2>Welcome to SP Games Store!</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Popular</a></li>
    <li><a data-toggle="tab" href="#menu1">Newly Added</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Popular</h3>
      <%	
      		conn=DBConnection.getConnection();

 		 	pstmt=conn.prepareStatement("SELECT g.gameID, title, price, description, imageLocation from games g,games_genre gg where g.gameID=gg.gameID and genreID=41");

 		 	rs=pstmt.executeQuery();

 		 	%>
 		 	<%while(rs.next()) { %>
 		 	
  				<div class="col-sm-6 col-md-4">
   					 <div class="thumbnail">
    					  <img src="<%=rs.getString("imageLocation") %>" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
     					 <div class="caption">
     					    <h3><%=rs.getString("title") %></h3>
      						<p><%=rs.getString("description") %></p>
     					    <p>$<%out.println(String.format("%.2f", rs.getDouble("price"))); %></p>
      					    <p><a href="#" class="btn btn-primary" role="button">Buy Now</a> <a href="gameDetails.jsp?gameID=<%=rs.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
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
 		 	
  				<div class="col-sm-6 col-md-4">
   					 <div class="thumbnail">
    					  <img src="<%=game.getString("imageLocation") %>" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
     					 <div class="caption">
     					    <h3><%=game.getString("title") %></h3>
      						<p><%=game.getString("description") %></p>
     					    <p>$<%out.println(String.format("%.2f", game.getDouble("price"))); %></p>
      					    <p><a href="#" class="btn btn-primary" role="button">Buy Now</a> <a href="gameDetails.jsp?gameID=<%=game.getInt("gameID")%>" class="btn btn-default" role="button">View</a></p>
    				     </div>
 				     </div>
 				 </div>
 				 
 				 
			<%} 
			  game.close();%> 
			
			<!-- <script>
			function equalHeight(group) {    
			    var tallest = 0;    
			    group.each(function() {       
			        var thisHeight = $(this).height();       
			        if(thisHeight > tallest) {          
			            tallest = thisHeight;       
			        }    
			    });    
			    group.each(function() { $(this).height(tallest); });
			} 

			$(document).ready(function() {   
			    equalHeight($(".thumbnail")); 
			});
			</script> -->
			
    </div>
  </div>
</div>
<%@include file="footer.html" %>
</body>
</html>