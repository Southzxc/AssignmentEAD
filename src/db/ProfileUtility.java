package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProfileUtility {
	public int chkProfileDetails(String emaildb, String username, String address, String email, String contact){
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
		//check if email is found in the sql server
		boolean emailFound = false;
		System.out.println(emaildb);
		System.out.println(email);
		if(!emaildb.equals(email)){
			try {
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("SELECT email FROM users where email = ?");
				pstmt.setString(1, email);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					emailFound = true;
					System.out.println(emailFound);
				}
				conn.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		System.out.println(emailFound + "1");
		
		/* The first if statement check if there is the input is empty, if it is empty, it will return false
		 * The second if statement check if contact has 8 digits in it, if it does not match, it will return false
		 * The third if statement check if email is found. if email is found, it will return false
		 * Finally, the else statement will return true if there are no errors with the input given
		 */
		if(username.isEmpty() || address.isEmpty() || email.isEmpty() || contact.isEmpty()){
			return 1;
		}else if(mcontact.matches() == false){
			return 2;
		}else if(countsymbol != 1 || !email.contains(".")){
			return 3;
		}else if(emailFound == true){
			return 4;
		}
		else{
			return 0;
		}
	}
	
	public void updtProfileDetails(String userID, String username, String address, String email, String contact){
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET username = ?, address = ?, email = ?, contact = ? where userID = ?");
			pstmt.setString(1, username);
			pstmt.setString(2, address);
			pstmt.setString(3, email);
			pstmt.setString(4, contact);
			pstmt.setString(5, userID);
			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int chkPasswordDetails(String passworddb, String password, String npassword, String cfpassword){
		
		//regex for checking if password contains at least alphanumeric characters with minimum length of 8 characters 
		Pattern ppassword = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d])|(?=.*\\d))|(?=.*[A-Z])(?=.*\\d)).{8,16}$");
		Matcher mpassword = ppassword.matcher(cfpassword);
		
		if(password.isEmpty() || npassword.isEmpty() || cfpassword.isEmpty()){
			return 1;
		}else if(!password.equals(passworddb)){
			return 2;
		}else if(!npassword.equals(cfpassword)){
			return 3;
		}else if(mpassword.matches() == false){
			return 4;
		}else{
			return 0;
		}		
	}
	
	public void updtPasswordDetails(String userID, String cfpassword){
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET userpwd = ? where userID = ?");
			pstmt.setString(1, cfpassword);
			pstmt.setString(2, userID);
			
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
