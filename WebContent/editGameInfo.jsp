<%
	if(session.getAttribute("admin") == null){
		response.sendRedirect("unauthorised.jsp");
	}else{
%>
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
                            <a href="logout.jsp"><i class="glyphicon glyphicon-off"></i> Log Out</a>
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
                        <a href="#"><i class="glyphicon glyphicon-edit"></i> Edit Game</a>
                    </li>                      
                    <li>
                        <a href="addGameGenre.jsp"><i class="glyphicon glyphicon-plus"></i> Add Games/Genre</a>
                    </li>
               
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

		<!-- Page to edit game information -->
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Edit game <small>Management</small>
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
	
        Connection conn=DBConnection.getConnection();
		
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
								            
								            <div class="col-xs-2">
								            	<label class="control-label">Quantity</label>
								            	<input type="number" class= "form-control" name="gameQuantity" min="0" value="<%=rs.getInt("quantity")%>" />
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
								            <div class="col-xs-8">
								                <label class="control-label">Image Location</label>
								                <input type="text" class="form-control" name="gameImageLocation" value="<%=rs.getString("imageLocation") %>"/>
								            </div>
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
								        <label class="control-label">Description</label>
								        <textarea class="form-control" name="gameDescription" rows="6"><%=rs.getString("description")%></textarea>
								    </div>
								    <button type="submit" class="btn btn-default">Save changes</button>
								    <a href="adminHomePage.jsp" type="button" class="btn btn-default" data-dismiss="modal">Close</a>
						        </form>
						        <!-- End of form -->					
								<%conn.close();%>		
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
<%}%>