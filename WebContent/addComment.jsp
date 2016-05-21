<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String gameID=request.getParameter("gameID");
	String commentName = request.getParameter("commentName");
	String rating = request.getParameter("rating");
	String comment = request.getParameter("comment");


 try{
	 Connection conn=DBConnection.getConnection();
	 
	 PreparedStatement pstmt=conn.prepareStatement("INSERT into comment(gameID, name,rating,date,comment)  VALUES(?,?,?,now(),?)");  

	 pstmt.setString(1, gameID);
	 pstmt.setString(2, commentName);
	 pstmt.setString(3, rating);
	 pstmt.setString(4, comment);


	 pstmt.executeUpdate();
	
	 response.sendRedirect("gameDetails.jsp?gameID=" + gameID);
	 
 }catch(Exception e){
	 out.println(e); //remember to change to error message when submitting
 }
 %>


</body>
</html>