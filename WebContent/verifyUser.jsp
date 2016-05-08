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

String username = request.getParameter("username");
String userpwd = request.getParameter("userpwd");
try{
	
		Class.forName("com.mysql.jdbc.Driver");

		String connURL ="jdbc:mysql://188.166.238.151/mkd?user=root&password=iloveeadxoxo"; 

		Connection conn =   DriverManager.getConnection(connURL);

		PreparedStatement pstmt=conn.prepareStatement("SELECT username, userpwd FROM users WHERE username = ?");
		
		pstmt.setString(1, username);
		
		ResultSet rs=pstmt.executeQuery();
		String usernameDB = "";
		String userpwdDB = "";
		while(rs.next()){
			usernameDB = rs.getString("username");
		    userpwdDB = rs.getString("userpwd");

		}//end while
		if(usernameDB.equals(username) && userpwdDB.equals(userpwd)){
			response.sendRedirect("adminHomePage.jsp");
			rs.close();
		}else{%>
		<!-- WHAT IS THIS  -->
		<div class="alert alert-warning">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Warning!</strong> There was a problem with your network connection.
    	</div>
    	<!-- TILL HERE -->
			<%response.sendRedirect("index.jsp");
		}

	
}catch(Exception e){
	out.println(e); //remember to change to error message when submitting
}

%>
</body>
</html>