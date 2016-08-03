<%
	if(session.getAttribute("admin") == null){
		response.sendRedirect("unauthorised.jsp");
	}else{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Page</title>
</head>
<body>
<!-- JSP + SQL for inserting games -->
<%
 String gameTitle = request.getParameter("gameTitle");
 String gameCompany = request.getParameter("gameCompany");
 String gameReleaseDate = request.getParameter("gameReleaseDate");
 String gameDescription = request.getParameter("gameDescription");
 String gamePrice = request.getParameter("gamePrice");
 String gameImageLocation = request.getParameter("gameImageLocation");
 String[] genre = request.getParameterValues("genre");
 String preOwned = request.getParameter("preOwned");
 String gameQuantity = request.getParameter("gameQuantity");
 try{
	 Connection conn=DBConnection.getConnection();

	 PreparedStatement pstmt=conn.prepareStatement("INSERT into games(title,company,releaseDate,description,price,imageLocation,preOwned,quantity)  VALUES(?,?,?,?,?,?,?,?)");  

	 pstmt.setString(1, gameTitle);
	 pstmt.setString(2, gameCompany);
	 pstmt.setString(3, gameReleaseDate);
	 pstmt.setString(4, gameDescription);
	 pstmt.setString(5, gamePrice);
	 pstmt.setString(6, gameImageLocation);
	 pstmt.setString(7, preOwned);
	 pstmt.setString(8, gameQuantity);

	 pstmt.executeUpdate();
	pstmt=conn.prepareStatement("SELECT max(gameid) 'gameid' from games");
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int gameid = rs.getInt(1);
	rs.close();
	
	for (String g:genre) {
	pstmt=conn.prepareStatement("INSERT into games_genre VALUES (?,?)");
	pstmt.setInt(1,gameid);
	pstmt.setInt(2,Integer.parseInt(g));
	pstmt.executeUpdate();	
	}
	conn.close();
 }catch(Exception e){
	 out.println(e);
 }
 
 response.setHeader("Refresh", "2;url=adminHomePage.jsp");

%>
GAME ADDED redirecting in 2 seconds

</body>
</html>
<%}%>