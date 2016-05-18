<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
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
                    <li>
                        <a href="adminHomePage.jsp"><i class="glyphicon glyphicon-dashboard "></i> Dashboard</a>
                    </li>
                    <li class="active">
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
                            Add Games/Genre <small>Management</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="glyphicon glyphicon-dashboard"></i> <a href="adminHomePage.jsp"> Dashboard</a>
                            </li>
                            <li class="active">
                            	<i class="glyphicon glyphicon-plus"></i> Add Games/Genre
                            </li>
                        </ol>
                    </div>
                    
					<div class="col-lg-10 col-lg-offset-1">
						<!-- Add game form -->
						<h2>Add game</h2>
						<form id="gameForm" method="post" action="addGame.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-8 ">
						                <label class="control-label">Title</label>
						                <input type="text" class="form-control" name="gameTitle" />
						            </div>
						            <div class="col-xs-2 selectContainer">
						                <label class="control-label">Genre</label><br>
						                <select id = "chooseGenre" class="form-control" name="genre" multiple="multiple">					
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
									
																								            
						        </div>
						    </div>
						
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4">
						                <label class="control-label">Company</label>
						                <input type="text" class="form-control" name="gameCompany" />
						            </div>
						
						            <div class="col-xs-4">
						                <label class="control-label">Release Date</label>
						                <input type="text" class="form-control" name="gameReleaseDate" />
						            </div>
						
						            <div class="col-xs-4">
						                <label class="control-label">Price</label>
						                <input type="text" class="form-control" name="gamePrice" />
						            </div>
						        </div>
						    </div>
						
							<div class="form-group">
						        <div class="row">
						            <div class="col-xs-8">
						                <label class="control-label">Image Location</label>
						                <input type="text" class="form-control" name="gameImageLocation" />
						            </div>
						            <div class="col-xs-2 selectContainer">
										<label class="control-label">Preowned</label><br>
										<select id = "choosePreOwned" class="form-control" name="preOwned" >
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>										
									</div>
						            <!-- Script for calling the drop down -->
									<script type="text/javascript">
									    $(document).ready(function() {
									        $('#choosePreOwned').multiselect({							        	
									        	nonSelectedText:'None'									        	
									        });
									    });
									</script>
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label class="control-label">Description</label>
						        <textarea class="form-control" name="gameDescription" rows="6"></textarea>
						    </div>
						
						
						    <button type="submit" class="btn btn-default">Add</button>
						</form>
						
						<!-- PAGE SEPARATOR -->
						<div class="container-liquid" >
						    <div class="row">
						        <div class="col-xs-12"><hr></div>
						        <hr>
						    </div>
						</div> 		
						<h2>Add genre</h2>
						<!-- Add Genre Form -->
						<form id="genreForm" method="post" action="addGenre.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4">
						                <label class="control-label">Genre</label>
						                <input type="text" class="form-control" name="genre" />
						            </div>
						        </div>
						    </div>
					        <button type="submit" class="btn btn-default">Add</button>
						</form>
						
                    </div>
                    
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