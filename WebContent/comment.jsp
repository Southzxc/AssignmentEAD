<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.3.min.js"></script>


<!--JQUERY PLUGIN FOR STARS RATING -->
<link rel="stylesheet" href="css/jquery.rating.css"> 
 <script src="js/jquery.form.js"></script>
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/jquery.rating.pack.js"></script> 

<!-- JQUERY PLUGIN FOR DROPDOWN -->
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
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
<link type="text/css" rel="stylesheet" media="screen" href="css/bootstrap-multiselect.css" />

<title>Insert title here</title>

</head>
<body>
<!-- PAGE SEPARATOR -->
<div class="container-liquid" >
	<div class="row">
		<div class="col-xs-12"><hr></div>
	</div>
</div>

<div class="col-lg-10 col-lg-offset-1">
						<!-- Add game form -->
						<h2>Reviews & Comments</h2>
						<form id="gameForm" method="post" action="addComment.jsp">				    			    
						    						    
						    <div class="form-group">
						        <div class="row">
						            <div class="col-xs-4 ">
						                <label class="control-label">Commenter Name:</label>
						                <input type="text" class="form-control" name="commentName" />
						            </div>				            
						        </div>
						    </div>
							
							<div class="form-group">
						        <div class="row">
						            <div class="col-xs-4 ">
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
						    	<div class="col-xs-5">
						        <label class="control-label">Comments:</label>
						        <textarea class="form-control" name="comment" rows="8"></textarea>
						        </div>
						        </div>
						    </div>
						
						
						    <button type="submit" class="btn btn-default">Comment</button>
						</form>

                    </div>
	

</body>
</html>