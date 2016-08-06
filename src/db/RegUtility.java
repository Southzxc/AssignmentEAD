package db;

import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//RegUtility consist of chkRegDetails and addRegDetails classes
public class RegUtility {
	/*
	 * chkRegDetails will return a string value
	 * chkRegDetails will accept 6 string parameters
	 */
	public String chkRegDetails(String username, String address, String email, String contact, String password, String cfpassword){
		
		//regex for checking contact
		Pattern pcontact = Pattern.compile("^[\\d+]{8}$");
		Matcher mcontact = pcontact.matcher(contact);
		
		//regex for checking if email contains '@'
		Pattern pemail = Pattern.compile("[@]");
		Matcher memail = pemail.matcher(email);
		int countsymbol = 0;
		while(memail.find()){ 
			countsymbol++; //increment based on how many '@' is found
		}
		
		//regex for checking if password contains at least alphanumeric characters with minimum length of 8 characters 
		Pattern ppassword = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d])|(?=.*\\d))|(?=.*[A-Z])(?=.*\\d)).{8,16}$");
		Matcher mpassword = ppassword.matcher(password);
		
		//check if email is found in the sql server
		boolean emailFound = false;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT email FROM users where email = ?");
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				emailFound = true;
			}
			conn.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* The first if statement check if there is the input is empty, if it is empty, it will return false
		 * The second if statement check if contact has 8 digits in it, if it does not match, it will return false
		 * The third  if statement check if password matches the requirement of alphanumeric characters with a minimum length of 8 characters,
		 * if it does not match, it will return false
		 * The fourth if statement check if email is found. if email is found, it will return false
		 * Finally, the else statement will return true if there are no errors with the input given
		 */
		if(username.isEmpty() || address.isEmpty() || email.isEmpty() || contact.isEmpty() || password.isEmpty() || cfpassword.isEmpty()){
			return "Please fill in all the blanks";
		}else if(mcontact.matches() == false){
			return "Please enter a 8-digit contact number";
		}else if(countsymbol != 1 || !email.contains(".")){
			return "Please enter a valid email address";
		}else if(mpassword.matches() == false){
			return "Please provide a password with numbers and alphabets that is at least 8 characters long";
		}else if(!password.equals(cfpassword)){
			return "Password and confirm password does not match.";
		}else if(emailFound == true){
			return "This email has already been used, please use another email to register";
		}
		else{
			return "";
		}
		
		
	}
	
	/*
	 * addRegDetails will not return any value
	 * addRegDetails will accept a request and a response parameter
	 */
	public void addRegDetails(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		UserModel UserModel = (UserModel)session.getAttribute("RegUserDetails");
		int isAdmin = 0;
		
		//This will insert all user registration details into the database
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, userpwd, address, email, contact, isAdmin) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, UserModel.getUsername());
			pstmt.setString(2, UserModel.getPassword());
			pstmt.setString(3, UserModel.getAddress());
			pstmt.setString(4, UserModel.getEmail());
			pstmt.setString(5, UserModel.getContact());
			pstmt.setInt(6, isAdmin);
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
}
