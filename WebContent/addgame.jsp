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
 String gametitle = request.getParameter("gametitle");
 String gamecompany = request.getParameter("gamecompany");
 String gamereleasedate = request.getParameter("gamereleasedate");
 String gamedescription = request.getParameter("gamedescription");
 String gameprice = request.getParameter("gameprice");
 String gameimagelocation = request.getParameter("gameimagelocation");
 
Class.forName("com.mysql.jdbc.Driver");

String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

Connection conn =   DriverManager.getConnection(connURL);

String sqlStr="INSERT into games(title,company,releaseDate,description,price,imageLocation)  VALUES(?,?,?,?,?,?)";

PreparedStatement pstmt=conn.prepareStatement(sqlStr);  

pstmt.setString(1, gametitle);
pstmt.setString(2, gamecompany);
pstmt.setString(3, gamereleasedate);
pstmt.setString(4, gamedescription);
pstmt.setString(5, gameprice);
pstmt.setString(6, gameimagelocation);

int count = pstmt.executeUpdate();
conn.close();



%>
ADDED A GAME
</body>
</html>