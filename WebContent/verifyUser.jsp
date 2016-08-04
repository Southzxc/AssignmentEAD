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

String email = request.getParameter("email");
String userpwd = request.getParameter("userpwd");
String rmbMe=request.getParameter("rememberMe");

boolean rememberMe=false;
if(rmbMe!=null){
	rememberMe=true;
}

try{
	Connection conn=DBConnection.getConnection();
	
	PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM users WHERE email = ? and userpwd = ?");
			
	pstmt.setString(1, email);
			
	pstmt.setString(2, userpwd);
			
	ResultSet rs=pstmt.executeQuery();	
			
	if(rs.next()){
		String userIDdb = rs.getString(1);
		String usernamedb = rs.getString(2);
		String userpwddb = rs.getString(3);
		String addressdb = rs.getString(4);
		String emaildb = rs.getString(5);
		String contactdb = rs.getString(6);
		int isAdmin = rs.getInt(7);
		if(isAdmin == 1){
			session.setAttribute("admin", usernamedb);
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
				UserModel UserModel = new UserModel();
				UserModel.setUserID(userIDdb);
				UserModel.setUsername(usernamedb);
				UserModel.setPassword(userpwddb);
				UserModel.setAddress(addressdb);
				UserModel.setEmail(emaildb);
				UserModel.setContact(contactdb);
				session.setAttribute("userDetails", UserModel);
				session.setAttribute("username", usernamedb);
				response.sendRedirect("index.jsp");				
		}
		
	}else{
		session.setAttribute("errorMsg", "Wrong Email or Password");
		response.sendRedirect("index.jsp");
	}
	rs.close();
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>