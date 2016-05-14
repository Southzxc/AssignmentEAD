<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
 String gameTitle = request.getParameter("gameTitle");
 String gameCompany = request.getParameter("gameCompany");
 String gameReleaseDate = request.getParameter("gameReleaseDate");
 String gameDescription = request.getParameter("gameDescription");
 String gamePrice = request.getParameter("gamePrice");
 String gameImageLocation = request.getParameter("gameImageLocation");
 String[] genre = request.getParameterValues("genre");
 String preOwned = request.getParameter("preOwned");
 System.out.println(genre);
 try{
	 Class.forName("com.mysql.jdbc.Driver");

	 String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

	 Connection conn =   DriverManager.getConnection(connURL);

	 PreparedStatement pstmt=conn.prepareStatement("INSERT into games(title,company,releaseDate,description,price,imageLocation,preOwned)  VALUES(?,?,?,?,?,?,?)");  

	 pstmt.setString(1, gameTitle);
	 pstmt.setString(2, gameCompany);
	 pstmt.setString(3, gameReleaseDate);
	 pstmt.setString(4, gameDescription);
	 pstmt.setString(5, gamePrice);
	 pstmt.setString(6, gameImageLocation);
	 pstmt.setString(7, preOwned);

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
	 out.println(e); //remember to change to error message when submitting
 }


%>
ADDED A GAME
</body>
</html>