package db;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegUtility {	
	public boolean chkRegDetails(String firstName, String lastName, String address, String email, String contact, String password){
		
		//regex for checking contact
		Pattern pcontact = Pattern.compile("^[\\d+]{8}$");
		Matcher mcontact = pcontact.matcher(contact);
		
		//regex for checking if email contains only 1 '@' and at least 1 '.'
		Pattern pemail = Pattern.compile("[@]");
		Matcher memail = pemail.matcher(email);
		int countsymbol = 0;
		while(memail.find()){
			countsymbol++;
		}
		
		//regex for checking if password contains at least alphanumeric characters with minimum length of 8 characters 
		Pattern ppassword = Pattern.compile("^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d])|(?=.*\\d))|(?=.*[A-Z])(?=.*\\d)).{8,16}$");
		Matcher mpassword = ppassword.matcher(password);
		
		if(firstName.equals("") || lastName.equals("") || address.equals("") || email.equals("") || contact.equals("") || password.equals("")){
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
}
