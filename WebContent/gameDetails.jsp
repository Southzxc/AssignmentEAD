<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<!--jquery plugin and css for stars rating -->
<script src="js/jquery.rating.pack.js"></script> 
<link rel="stylesheet" href="css/jquery.rating.css"> 
<title>SP Games Store</title>
</head>

<!-- Page to display specific details on the game -->
<body>
	<%@include file="navbar.jsp" %>
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-10 col-md-offset-1">
            
      <%	
      		String gameID=request.getParameter("gameID");
      	
			conn=DBConnection.getConnection();

 		 	pstmt=conn.prepareStatement("SELECT * FROM games where gameID = ?");

 		 	pstmt.setString(1,gameID);
 		 	
 		 	rs=pstmt.executeQuery();
			
 		 	rs.next();
 		 	
 		 	
 		 	
 		 	%>
 		 	
                <div class="thumbnail">
                    <img class="img-responsive" src="<%=rs.getString("imageLocation") %>" alt="Image not available" onError="this.src='http://placehold.it/460x215?text=Image+not+available';">
                    <div class="caption-full">
                        <h3 class="pull-right">$<%out.println(String.format("%.2f", rs.getDouble("price"))); %></h3>
                        <h3><%=rs.getString("title") %><small class="gDTitleSide"><%=rs.getString("preowned").equals("Yes") ? "Pre-owned" : "Brand new!" %></small></h3>
                        <form action="addToCart">
                        		<input type="hidden" name="gameID" value="<%=rs.getInt("gameID")%>">
	      					    <input type="hidden" name="title" value="<%=rs.getString("title") %>">
	      					    <input type="hidden" name="company" value="<%=rs.getString("company") %>">
	      					    <input type="hidden" name="price" value="<%=rs.getDouble("price") %>">
	      					    <input type="hidden" name="imageLocation" value="<%=rs.getString("imageLocation") %>">
	      					    <input type="hidden" name="preOwned" value="<%=rs.getString("preOwned") %>">
	      					    <input type="hidden" name="quantity" value="1">
	      					    <input type="submit" value="BUY" class="btn btn-success pull-right" role="button">
	      				</form>
                        <b>Company</b> <p><%=rs.getString("company") %></p>
                                               <%
                        pstmt=conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
                        pstmt.setString(1, gameID); 
                        ResultSet displayGenre = pstmt.executeQuery();
                        %>
                        
                        <b>Genre</b>
                        <p>
                       <% while(displayGenre.next()){ %>
                        <span class="label label-info"><%=displayGenre.getString("genreName") %></span>   
                        <% }
                       	   displayGenre.close();%>
                        </p>
                        <b>Description</b><p><%=rs.getString("description") %></p>
                    </div>                         
                </div>

				<div>
				
				<!-- Show comment section only when game is not preowned -->
				<%if(rs.getString("preOwned").equals("No")){ %>
	                <div class="well container-fluid">
						<div class="col-lg-10 col-lg-offset-1">
						
							<!-- Add comment form -->
							<h2>Reviews & Comments</h2>
							<form id="gameForm" method="post" action="addComment.jsp?gameID=<%=rs.getInt("gameID")%>">				    			    
							    						    
							    <div class="form-group">
							        <div class="row">
							            <div class="col-xs-10 ">
							                <label class="control-label">Commenter Name:</label>
							                <input type="text" class="form-control" name="commentName" />
							            </div>				            
							        </div>
							    </div>
								
								<div class="form-group">
							        <div class="row">
							            <div class="col-xs-8 ">
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
							    	<div class="col-xs-10">
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
	
	                    
	                    <%pstmt=conn.prepareStatement("SELECT name, date, comment, rating from comment where gameID=?");
	                      
	                      pstmt.setString(1, gameID);
	                    
	                      ResultSet displayComment=pstmt.executeQuery();
	                      
	                      while(displayComment.next()) {%>
	
						<!-- Displaying available comments -->
	                    <div class="row">
	                        <div class="col-md-12">
	                            <span class="pull-right"><%=displayComment.getDate("date") %></span>
	                            <p>Name: <%=displayComment.getString("name") %></p><p>Rating: <%=displayComment.getInt("rating") %>/5</p>
	                            <p>Comment: <%=displayComment.getString("comment") %></p>
	                        </div>
	                    </div>
	
	                    <hr>
						<%} 
	                      displayComment.close();
	                      } else{
	                    	  out.println("Comments unavailable");
	                      } 
						  rs.close();	                    	  
	                      		%>

                	</div>

            	</div>

        	</div>

    	</div>
    	<!-- /.row -->
	</div>
	<!-- /.container -->

<%@include file="footer.html" %>
</body>

</html>
