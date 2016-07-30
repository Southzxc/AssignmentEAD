package db;

import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.*;

public class RegUtility {	
	public int chkRegDetails(String username, String address, String email, String contact, String password){
		
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
		if(username.isEmpty() || address.isEmpty() || email.isEmpty() || contact.isEmpty() || password.isEmpty()){
			return 1;
		}else if(mcontact.matches() == false){
			return 2;
		}else if(countsymbol != 1 || !email.contains(".")){
			return 3;
		}else if(mpassword.matches() == false){
			return 4;
		}else if(emailFound == true){
			return 5;
		}
		else{
			return 0;
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
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
}
