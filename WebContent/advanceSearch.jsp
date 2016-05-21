<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<link type="text/css" rel="stylesheet" media="screen" href="css/bootstrap-multiselect.css" />
<title>SP Games Store</title>
</head>

<body>
	<%@include file="navbar.jsp" %>
	
	<div class="col-lg-10 col-lg-offset-1">
						<!-- Add game form -->
						<h2>Search game</h2>
						<form id="advSearchForm" method="post" action="advanceSearchResult.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4 ">
						                <label class="control-label">Title</label>
						                <input type="text" class="form-control" name="gameTitle" />
						            </div>
						            <div class="as col-xs-2 selectContainer">
						                <label class="control-label">Genre</label><br>
						                <select id = "chooseGenre" class="form-control" name="genre" >					
					<%
							conn=DBConnection.getConnection();

							pstmt=conn.prepareStatement("SELECT * FROM genre");
							
							rs=pstmt.executeQuery();
							
							while(rs.next()){ 
					%>						
						                    <option value="<%=rs.getInt("genreID")%>"><%=rs.getString("genreName")%></option>						                    						               							
					<%		} 
							rs.close();
					%>		
						                </select>
						            </div>												

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
									
									
									<div class="as col-xs-2 selectContainer">
									<label class="control-label">Preowned</label><br>
										<input type="radio" name="preOwned" value="Yes" checked>Yes
										<input type="radio" name="preOwned" value="No">No
									</div>											            
						        </div>
						    </div>
						
			

						
						    <button type="submit" class="btn btn-default">Search</button>
						</form>
						


						
                    </div>
           <%@include file="footer.html" %>
</body>
</html>