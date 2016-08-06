package db;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateProfileController
 */
@WebServlet("/UpdateProfileController")
public class UpdateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * This controller will get the userdetails parameters and pass them into chkProfileDetails class in ProfileUtility
		 * It will then check if chkProfileDetails will return an empty String, if it does, all the parameters will then be stored in
		 * the UserModel and then the class updtProfileDetails will be called
		 * The controller will then redirect back to updateProfile.jsp with a success message
		 */
		HttpSession session = request.getSession();		
		UserModel userDetails = (UserModel)session.getAttribute("userDetails");
		String emaildb = userDetails.getEmail();
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		
		ProfileUtility ProfileUtility = new ProfileUtility();
		String chkProfileDetails = ProfileUtility.chkProfileDetails(emaildb, username, address, email, contact);
		if(!chkProfileDetails.isEmpty()){
			session.setAttribute("errorMsg", chkProfileDetails);
			response.sendRedirect("updateProfile.jsp");
		}else{
			userDetails.setUsername(username);
			userDetails.setAddress(address);
			userDetails.setEmail(email);
			userDetails.setContact(contact);
			ProfileUtility.updtProfileDetails(request, response);
			session.setAttribute("success", "Profile updated.");
			response.sendRedirect("updateProfile.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * This controller will get all the password parameters and pass them into chkPasswordDetails in the ProfileUtility
		 * It will then check if chkPasswordDetails returns an empty String, if it does, it will store the new password details in the
		 * UserModel
		 * updtPasswordDetails class is then called to update the password in the DB
		 * After that, it will then redirect to updateProfile.jsp and display a success message
		 */
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();		
		UserModel userDetails = (UserModel)session.getAttribute("userDetails");
		String passworddb = userDetails.getPassword();
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		String cfpassword = request.getParameter("cfpassword");
		
		ProfileUtility ProfileUtility = new ProfileUtility();
		String chkPassword = ProfileUtility.chkPasswordDetails(passworddb, password, npassword, cfpassword);
		
		if(!chkPassword.isEmpty()){
			session.setAttribute("errorMsg", chkPassword);
			response.sendRedirect("updateProfile.jsp");
		}else{
			userDetails.setPassword(cfpassword);
			ProfileUtility.updtPasswordDetails(request, response);
			session.setAttribute("success", "Password updated.");
			response.sendRedirect("updateProfile.jsp");
		}
	}

}
