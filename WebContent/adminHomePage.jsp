<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="header.html" %>	
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
<link type="text/css" rel="stylesheet" media="screen" href="css/sb-admin.css" />
<link type="text/css" rel="stylesheet" media="screen" href="css/bootstrap-multiselect.css" />	
<title>Administrator Page</title>
</head>
<body class="adminBody">
	<div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top navbar-border" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adminHomePage.jsp">SP Games Store Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> Admin <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="index.jsp"><i class="glyphicon glyphicon-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="adminHomePage.jsp"><i class="glyphicon glyphicon-dashboard "></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="addGameGenre.jsp"><i class="glyphicon glyphicon-plus"></i> Add Games/Genre</a>
                    </li>                  
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>Overview</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-dashboard"></i> Dashboard
                            </li>
                        </ol>
				    </div>
				                    
				<%
				
						Connection conn=DBConnection.getConnection();
				
						PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM games ORDER BY title ASC");
						
						ResultSet rs=pstmt.executeQuery();
						
						
				%>
					<!-- GAMES TABLE START -->
					<div class="col-lg-12">
						<h2>Games</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
						
										<th>Title</th>
										<th>Company</th>
										<th>Release date</th>
										<th>Price</th>
										<th>More information</th>
										<th>Manage</th>
									
									</tr>		
								</thead>
				<%		while(rs.next()){
				 				String gameID = rs.getString("gameID");				
								pstmt = conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
								pstmt.setString(1, gameID);
								ResultSet genreName = pstmt.executeQuery(); 
								%>
								<tbody>
									<tr>
										<td><%=rs.getString("title") %></td>
										<td><%=rs.getString("company") %></td>
										<td><%=rs.getDate("releaseDate") %></td>
										<td><%out.println(String.format("%.2f", rs.getDouble("price"))); %></td>
										
										<!-- Modal button for more info -->
										<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#description<%=rs.getInt("gameID")%>">More information</button></td>
										
										<!-- Modal for more info -->
										<div class="modal fade " id="description<%=rs.getInt("gameID") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										  <div class="modal-dialog">
										    <div class="modal-content">
											  <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">More information</h4>
										      </div>
										      <div class="modal-body">						      						      							      	
										      	<h4>Genre</h4>
										      	<%						      	
										      	while(genreName.next()){						      		
										      		%>
										      		<%=genreName.getString("genreName") %>
										      	<%} 
										      	genreName.close();
										      	
										      	%>
										      	<h4>Description</h4>
										      	<%=rs.getString("description")%>
										      	<h4>Preowned</h4>
										      	<%=rs.getString("preOwned")%>
										      	<h4>Image Location</h4>
										      	<%=rs.getString("imageLocation")%>
										      </div>						    
										    </div>
										  </div>
										</div>
										
										<td>
										<!-- Modal button for edit game -->
										<a href="editGameInfo.jsp?gameID=<%=rs.getInt("gameID")%>" type="button" class="btn btn-primary btn-sm glyphicon glyphicon-edit" ></a>
										<!-- Modal button for delete game-->
										<button type="button" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteGame<%=rs.getInt("gameID")%>"></button>
										</td>
										
										
										
										<!-- Modal for delete game -->
										<div class="modal fade bs-example-modal-sm" id="deleteGame<%=rs.getInt("gameID") %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
										  <div class="modal-dialog modal-sm">
										    <div class="modal-content">
											  <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">Warning</h4>
										      </div>
										      <div class="modal-body">
										      	Are you sure you want to delete?
										      </div>
										      <div class="modal-footer">
										      	<a href="deleteGame.jsp?gameID=<%=rs.getInt("gameID")%>" type="button" class="btn btn-danger">Delete</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>						      
										      </div>						    
										    </div>
										  </div>
										</div>						
						 			</tr>
					 			</tbody>
					 			
				<%		}		%>
							</table>
						</div>
					</div>
					<!-- GAMES TABLE END -->
						
						<% pstmt=conn.prepareStatement("SELECT * FROM genre ORDER BY genreName ASC");
						
							rs=pstmt.executeQuery();%>
					
					<!-- GENRE TABLE START -->
					<div class="col-lg-3">
						<h2>Genre</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Genre</th>
										<th>Manage</th>
									</tr>
								</thead>
				<%		while(rs.next()){
								%>
								<tbody>
									<tr>
										<td><%=rs.getString("genreName") %></td>
										
										<td>
										<!-- Modal button for edit genre -->
										<button type="button" class="btn btn-primary btn-sm glyphicon glyphicon-edit" data-toggle="modal" data-target="#editGenre<%=rs.getInt("genreID")%>"></button>
										<!-- Modal button for delete genre -->
										<button type="button" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteGenre<%=rs.getInt("genreID")%>"></button>
										</td>
										
										<!-- Modal for edit genre -->
										<div class="modal fade bs-example-modal-sm" id="editGenre<%=rs.getInt("genreID") %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
										  <div class="modal-dialog modal-sm">
										    <div class="modal-content">
											  <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">Edit genre info</h4>
										      </div>
										      <div class="modal-body">
												<form id="gameForm" method="post" action="updateGenreInfo.jsp">
													<div class="form-group">
												        <div class="row">
												            <div class="col-xs-4">
												                <label class="control-label">ID</label>
												                <input type="text" class="form-control" name="genreID" value="<%=rs.getInt("genreID")%>" readonly/>
												            </div>
												        </div>
												    </div>
												    <div class="form-group">
												        <div class="row">
												            <div class="col-xs-8">
												                <label class="control-label">Genre</label>
												                <input type="text" class="form-control" name="genre" value="<%=rs.getString("genreName") %>" />
												            </div>
												        </div>
												    </div>
											        <button type="submit" class="btn btn-default">Save changes</button>
											        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</form>
												<!-- End of form -->						      	
										      </div>
										      <!-- End of modal-body -->						    
										    </div>
										  </div>
										</div>
										<!-- End of modal for edit genre -->
										
										<!-- Modal for delete genre -->
										<div class="modal fade bs-example-modal-sm" id="deleteGenre<%=rs.getInt("genreID") %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
										  <div class="modal-dialog modal-sm">
										    <div class="modal-content">
											  <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">Warning</h4>
										      </div>
										      <div class="modal-body">
										      	Are you sure you want to delete?
										      </div>
										      <div class="modal-footer">
										      	<a href="deleteGenre.jsp?genreID=<%=rs.getInt("genreID")%>" type="button" class="btn btn-danger">Delete</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>						      
										      </div>						    
										    </div>
										  </div>
										</div>
									
									</tr>
								</tbody>		
				<%		}		%>
							</table>
						</div>
					</div>
					<!-- GENRE TABLE END -->
				<%			rs.close();%>	
					
				</div>
				<!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>    
        <!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
         
</body>
</html>