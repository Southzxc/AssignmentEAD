<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String gameID = request.getParameter("gameID");
String gameTitle = request.getParameter("gameTitle");
String gameCompany = request.getParameter("gameCompany");
String gameReleaseDate = request.getParameter("gameReleaseDate");
String gameDescription = request.getParameter("gameDescription");
String gamePrice = request.getParameter("gamePrice");
String gameImageLocation = request.getParameter("gameImageLocation");
String[] genre = request.getParameterValues("genre");
String preOwned = request.getParameter("preOwned");
System.out.println(genre);
System.out.println(preOwned);


	Class.forName("com.mysql.jdbc.Driver");

	String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

	Connection conn =   DriverManager.getConnection(connURL);

	PreparedStatement pstmt=conn.prepareStatement("UPDATE games SET title=?, company=?, releaseDate=?, description=?, price=?, imagelocation=?, preOwned=? WHERE gameID=?");

	pstmt.setString(1, gameTitle);
	pstmt.setString(2, gameCompany);
	pstmt.setString(3, gameReleaseDate);
	pstmt.setString(4, gameDescription);
	pstmt.setString(5, gamePrice);
	pstmt.setString(6, gameImageLocation);
	pstmt.setString(7, preOwned);
	pstmt.setString(8, gameID);
	

	pstmt.executeUpdate();
	
	pstmt = conn.prepareStatement("DELETE FROM games_genre where gameID = ?");
	
	pstmt.setString(1, gameID);
	
	pstmt.executeUpdate();
	if(genre == null){
		System.out.println("There is nothing");
	}else{
		for(String g: genre){
			pstmt = conn.prepareStatement("INSERT INTO games_genre VALUES (?,?)");
			pstmt.setString(1, gameID);
			pstmt.setString(2, g);
			pstmt.executeUpdate();
		}		
	}
	
	
	conn.close();

	response.sendRedirect("adminHomePage.jsp");


%>
</body>
</html>