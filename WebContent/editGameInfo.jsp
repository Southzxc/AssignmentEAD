


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.3.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
	
<!-- JQUERY PLUGIN FOR DROPDOWN -->
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>

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
                        <a href="adminHomePage.jsp"><i class="glyphicon glyphicon-dashboard "></i> Dashboard</a>
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
                            Dashboard <small>edit game</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-dashboard"></i><a href="adminHomePage.jsp"> Dashboard</a>
                            </li>
                            <li class="active">
                            	<i class="glyphicon glyphicon-edit"></i> Edit Games
                            </li>
                        </ol>
                    </div>
                    
<%

		String gameID = request.getParameter("gameID");
	
		Class.forName("com.mysql.jdbc.Driver");

		String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

		Connection conn =   DriverManager.getConnection(connURL);
		
		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM games where gameID = ?");
		
		pstmt.setString(1, gameID);
		
		ResultSet rs = pstmt.executeQuery();
						

		
		
%>

	<div class="col-lg-10 col-lg-offset-1">
		<h2>Games</h2>

<%		rs.next();
	pstmt = conn.prepareStatement("SELECT gg.genreID, genreName FROM games ga, genre ge, games_genre gg WHERE ga.gameID = gg.gameID and ge.genreID = gg.genreID and ga.gameID = ?");
	pstmt.setString(1, gameID);
	ResultSet genreName = pstmt.executeQuery();
	
  	ArrayList<Integer> a1 = new ArrayList<Integer>();
  		while(genreName.next()){
  			a1.add(genreName.getInt("genreID"));	
  		}  		
				%>

						        <form action="updateGameInfo.jsp" method="post">
						        	<div class="form-group">
								        <div class="row">
								            <div class="col-xs-2">
								                <label class="control-label">ID</label>
								                <input type="text" class="form-control" name="gameID" value="<%=rs.getInt("gameID")%>" readonly/>
								            </div>
								        </div>
								    </div>					
								    <div class="form-group">
								        <div class="row">
								            <div class="col-xs-8 ">
								                <label class="control-label">Title</label>
								                <input type="text" class="form-control" name="gameTitle" value="<%=rs.getString("title")%>" />
								            </div>
								
								            <div class="col-xs-2 selectContainer">
								                <label class="control-label">Genre</label><br>
								                <select class="form-control chooseGenre" name="genre" multiple="multiple">
								                    <%
								                    pstmt = conn.prepareStatement("SELECT * FROM genre");
													ResultSet updateGenre = pstmt.executeQuery();
													
													while(updateGenre.next()){
								                    %>
								                    <option value="<%=updateGenre.getInt("genreID")%>" <%=a1.contains(updateGenre.getInt("genreID")) ? "selected" : "" %>><%=updateGenre.getString("genreName") %></option>
								                    <% } %>								                    
								                </select>
								            </div>
								            <!-- Script for calling the drop down -->
											<script type="text/javascript">
											    $(document).ready(function() {
											        $('.chooseGenre').multiselect({
											        	includeSelectAllOption: true,
											        	nonSelectedText:'None',
											        	numberDisplayed: 1
											        });
											    });
											</script>
											<div class="col-xs-2 selectContainer">
												<label class="control-label">Preowned</label><br>
												<select class="form-control choosePreOwned" name="preOwned" >
													<option value="Yes"<%=rs.getString("preOwned").equals("Yes") ? "selected" : "" %>>Yes</option>
													<option value="No" <%=rs.getString("preOwned").equals("No") ? "selected" : "" %>>No</option>
												</select>										
											</div>
											<!-- Script for calling the drop down -->
											<script type="text/javascript">
											    $(document).ready(function() {
											        $('.choosePreOwned').multiselect({
											        	nonSelectedText:'None',
											        });
											    });
											</script>																			            
								        </div>
								    </div>
								
								    <div class="form-group">
								        <div class="row">
								            <div class="col-xs-4">
								                <label class="control-label">Company</label>
								                <input type="text" class="form-control" name="gameCompany" value="<%=rs.getString("company")%>" />
								            </div>
								
								            <div class="col-xs-4">
								                <label class="control-label">Release Date</label>
								                <input type="text" class="form-control" name="gameReleaseDate" value="<%=rs.getString("releaseDate")%>" />
								            </div>
								
								            <div class="col-xs-4">
								                <label class="control-label">Price</label>
								                <input type="text" class="form-control" name="gamePrice" value="<%=rs.getDouble("price")%>" />
								            </div>
								        </div>
								    </div>
								
									<div class="form-group">
								        <div class="row">
								            <div class="col-xs-12">
								                <label class="control-label">Image Location</label>
								                <input type="text" class="form-control" name="gameImageLocation" value="<%=rs.getString("imageLocation") %>"/>
								            </div>
								        </div>
								    </div>
								    
								    <div class="form-group">
								        <label class="control-label">Description</label>
								        <textarea class="form-control" name="gameDescription" rows="6"><%=rs.getString("description")%></textarea>
								    </div>
								    <button type="submit" class="btn btn-default">Save changes</button>
								    <a href="adminHomePage.jsp" type="button" class="btn btn-default" data-dismiss="modal">Close</a>
						        </form>
						        <!-- End of form -->					


			
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