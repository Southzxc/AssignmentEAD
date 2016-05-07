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
<title>Adminstrator Page</title>
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
                    <li>
                        <a href="adminHomePage.jsp"><i class="glyphicon glyphicon-dashboard "></i> Dashboard</a>
                    </li>
                    <li class="active">
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
                    
					<div class="col-lg-6">
						<!-- Add game form -->
						<form id="gameForm" method="post" action="addGame.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-8">
						                <label class="control-label">Title:</label>
						                <input type="text" class="form-control" name="gameTitle" />
						            </div>
						
						            <!-- <div class="col-xs-4 selectContainer">
						                <label class="control-label">Genre</label>
						                <select class="form-control" name="genre">
						                    <option value="">Choose a genre</option>
						                    <option value="action">Action</option>
						                    <option value="comedy">Comedy</option>
						                    <option value="horror">Horror</option>
						                    <option value="romance">Romance</option>
						                </select>
						            </div> -->
						        </div>
						    </div>
						
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4">
						                <label class="control-label">Company:</label>
						                <input type="text" class="form-control" name="gameCompany" />
						            </div>
						
						            <div class="col-xs-4">
						                <label class="control-label">Release Date:</label>
						                <input type="text" class="form-control" name="gameReleaseDate" />
						            </div>
						
						            <div class="col-xs-4">
						                <label class="control-label">Price:</label>
						                <input type="text" class="form-control" name="gamePrice" />
						            </div>
						        </div>
						    </div>
						
							<div class="form-group">
						        <div class="row">
						            <div class="col-xs-12">
						                <label class="control-label">Image Location:</label>
						                <input type="text" class="form-control" name="gameImageLocation" />
						            </div>
						        </div>
						    </div>
						    
						    <div class="form-group">
						        <label class="control-label">Desciption:</label>
						        <textarea class="form-control" name="gameDescription" rows="8"></textarea>
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
						
						<!-- Add Genre Form -->
						<form id="gameForm" method="post" action="addGenre.jsp">
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-2">
						                <label class="control-label">Genre:</label>
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