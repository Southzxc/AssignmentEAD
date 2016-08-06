package db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * This controller will get all the parameters from register.jsp and pass them to chkRegDetails in regutility
		 * It will then check if chkRegDetails returns an empty string, if it does, all the parameters will be set using a model
		 * addRegDetails will then be invoked where it will add the new user into the database
		 *
		 */
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");
		String cfpassword = request.getParameter("cfpassword");
		
		RegUtility RegUtility = new RegUtility();
		String chkRegDetails = RegUtility.chkRegDetails(username, address, email, contact, password, cfpassword);
		HttpSession session = request.getSession();		
		if(!chkRegDetails.isEmpty()){
			session.setAttribute("errorMsg", chkRegDetails);
			response.sendRedirect("register.jsp");
		}else{
			UserModel UserModel = new UserModel();
			UserModel.setUsername(username);
			UserModel.setAddress(address);
			UserModel.setEmail(email);
			UserModel.setContact(contact);
			UserModel.setPassword(cfpassword);
			session.setAttribute("RegUserDetails", UserModel);
			RegUtility.addRegDetails(request, response);
			session.setAttribute("success", "Thank you for registering with us!");
			response.sendRedirect("register.jsp");
		}
	}

}
