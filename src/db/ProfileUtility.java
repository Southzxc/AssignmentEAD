package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//ProfileUtility consist of chkProfileDetails updtProfileDetails, chkPasswordDetails and updtPasswordDetails
public class ProfileUtility {
	/*
	 * chkProfileDetails returns a String value
	 * chkProfileDetails will accept 5 string parameters
	 */
	public String chkProfileDetails(String emaildb, String username, String address, String email, String contact){
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
		if(!emaildb.equals(email)){
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
		}
		
		/* The first if statement check if there is the input is empty, if it is empty, it will return false
		 * The second if statement check if contact has 8 digits in it, if it does not match, it will return false
		 * The third if statement check if email is found. if email is found, it will return false
		 * Finally, the else statement will return true if there are no errors with the input given
		 */
		if(username.isEmpty() || address.isEmpty() || email.isEmpty() || contact.isEmpty()){
			return "Please fill in all the blanks";
		}else if(mcontact.matches() == false){
			return "Please enter a 8-digit contact number";
		}else if(countsymbol != 1 || !email.contains(".")){
			return "Please enter a valid email address";
		}else if(emailFound == true){
			return "This email has already been used, please use another email";
		}
		else{
			return "";
		}
	}
	/*
	 * updtProfileDetails does not return any value
	 * updtProfileDetails will accept a request and a response parameter
	 */
	public void updtProfileDetails(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		//getting of session userDetails set in verifyUser.jsp
		UserModel UserDetails = (UserModel)session.getAttribute("userDetails");
		
		 //Updating of the user details
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET username = ?, address = ?, email = ?, contact = ? where userID = ?");
			pstmt.setString(1, UserDetails.getUsername());
			pstmt.setString(2, UserDetails.getAddress());
			pstmt.setString(3, UserDetails.getEmail());
			pstmt.setString(4, UserDetails.getContact());
			pstmt.setString(5, UserDetails.getUserID());
			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/*
	 * chkPasswordDetails returns a value string
	 * chkPasswordDetails will accept 5 string parameteres
	 */
	public String chkPasswordDetails(String passworddb, String password, String npassword, String cfpassword){
		
		//regex for checking if password contains at least alphanumeric characters with minimum length of 8 characters 
		Pattern ppassword = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d])|(?=.*\\d))|(?=.*[A-Z])(?=.*\\d)).{8,16}$");
		Matcher mpassword = ppassword.matcher(cfpassword);
		
		/*
		 * 1st 'if' check if all 3 password fields are empty
		 * 2nd 'if' check if the current password match with the password stored in the database
		 * 3rd 'if' check if new password and confirm password matches
		 * 4th 'if' check if the new password provided by the user matches the criteria of alphanumeric characters
		 */
		if(password.isEmpty() || npassword.isEmpty() || cfpassword.isEmpty()){
			return "Please fill in all the blanks.";
		}else if(!password.equals(passworddb)){
			return "Wrong current password.";
		}else if(!npassword.equals(cfpassword)){
			return "New password and confirm password does not match.";
		}else if(mpassword.matches() == false){
			return "Please provide a password with numbers and alphabets that is 8 to 16 characters long";
		}else{
			return "";
		}		
	}
	
	/*
	 * updtPasswordDetails does not return any value
	 * updtPasswordDetails will accept a request and a response parameter
	 */
	public void updtPasswordDetails(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		
		//getting of session userDetails set in verifyUser.jsp
		UserModel UserDetails = (UserModel)session.getAttribute("userDetails");
		
		//Updating of user password
		try{
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET userpwd = ? where userID = ?");
			pstmt.setString(1, UserDetails.getPassword());
			pstmt.setString(2, UserDetails.getUserID());
			
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
