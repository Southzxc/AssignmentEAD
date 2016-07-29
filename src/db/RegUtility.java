package db;

import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.*;

public class RegUtility {	
	public boolean chkRegDetails(String username, String address, String email, String contact, String password){
		
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
		
		/* The first if statement check if there is the input is empty, if it is empty, it will return false
		 * The second if check if contact has 8 digits in it, if it does not match, it will return false
		 * The third  if check if password matches the requirement of alphanumeric characters with a minimum length of 8 characters,
		 * if it does not match, it will return false
		 * Finally, the else statement will return true if there are no errors with the input given
		 */
		if(username.equals("") || address.equals("") || email.equals("") || contact.equals("") || password.equals("")){
			return false;
		}else if(mcontact.matches() == false){
			return false;
		}else if(countsymbol != 1 || !email.contains(".")){
			return false;
		}else if(mpassword.matches() == false){
			return false;
		}
		else{
			return true;
		}
		
		
	}
	
	public void addRegDetails(String username, String address, String email, String contact, String password){
		int isAdmin = 0;
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, userpwd, address, email, contact, isAdmin) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, address);
			pstmt.setString(4, email);
			pstmt.setString(5, contact);
			pstmt.setInt(6, isAdmin);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
}
