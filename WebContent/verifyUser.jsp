<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/* JSP + SQL statements to verify login abc*/

String username = request.getParameter("username");
String userpwd = request.getParameter("userpwd");
String rmbMe=request.getParameter("rememberMe");

boolean rememberMe=false;
if(rmbMe!=null){
	rememberMe=true;
}

try{
	Connection conn=DBConnection.getConnection();
	
	PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM users WHERE username = ? and userpwd = ?");
			
	pstmt.setString(1, username);
			
	pstmt.setString(2, userpwd);
			
	ResultSet rs=pstmt.executeQuery();	
			
	while(rs.next()){
		int isAdmin = rs.getInt(4);
		if(isAdmin == 1){
			session.setAttribute("admin", username);
			response.sendRedirect("adminHomePage.jsp");
		}
		else{

			/* if(rememberMe){
				Cookie c1=new Cookie("cookieloginUser",username);
				Cookie c2=new Cookie("cookieLoginPassword",userpwd);
				c1.setMaxAge(60*60*24);
				c2.setMaxAge(60*60*24); 
				response.addCookie(c1);
				response.addCookie(c2);
			
			} */
				session.setAttribute("user", username); 
				response.sendRedirect("index.jsp");	
			
		}
		
	}
		
	response.setHeader("Refresh","2;url=index.jsp");
}catch(Exception e){
	out.println(e);
}
%>
Wrong Username or Password, redirecting back to homepage in 2 seconds
</body>
</html>