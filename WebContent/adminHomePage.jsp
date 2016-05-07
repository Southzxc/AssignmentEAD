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
<link type="text/css" rel="stylesheet" media="screen" href="css/home.css" />
<link type="text/css" rel="stylesheet" media="screen" href="css/sb-admin.css" />	
<title>Administrator Page</title>
</head>
<body>
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
                <a class="navbar-brand" href="index.html">SP Games Store Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-cog"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.html"><i class="glyphicon glyphicon-dashboard "></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="addGameGenre.jsp"><i class="glyphicon glyphicon-plus"></i> Add Games/Genre</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
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
	try{
		Class.forName("com.mysql.jdbc.Driver");

		String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

		Connection conn =   DriverManager.getConnection(connURL);

		PreparedStatement pstmt=conn.prepareStatement("Select * from games");
		
		/* pstmt.setString(1, username); */
		
		ResultSet rs=pstmt.executeQuery();
%>
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
						<th>Description</th>
						<th>Manage</th>
					
					</tr>		
				</thead>
<%		while(rs.next()){
				%>
				<tbody>
					<tr>
						
						<td><%=rs.getString("title") %></td>
						<td><%=rs.getString("company") %></td>
						<td><%=rs.getDate("releaseDate") %></td>
						<td><%=rs.getDouble("price") %></td>
						
						<!-- Modal button for Description -->
						<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#description<%=rs.getInt("gameID")%>">Description</button></td>
						
						<!-- Modal for Description -->
						<div class="modal fade bs-example-modal-sm" id="description<%=rs.getInt("gameID") %>" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
						  <div class="modal-dialog modal-sm">
						    <div class="modal-content">
							  <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">Description</h4>
						      </div>
						      <div class="modal-body">
						      	<%=rs.getString("description") %>
						      </div>						    
						    </div>
						  </div>
						</div>
						
						<!-- Modal button for delete game-->
						<td><button type="button" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteGame<%=rs.getInt("gameID")%>"></button></td>
						
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
		<% pstmt=conn.prepareStatement("Select * from genre");
		
			rs=pstmt.executeQuery();%>
	
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
						
						<!-- Modal button for delete genre -->
						<td><button type="button" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#deleteGenre<%=rs.getInt("genreID")%>"></button></td>
						
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
<%			rs.close();
		}catch(Exception e){
			out.println(e);//remember to change when submitting code 
		}
		
	
	%>	
					
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