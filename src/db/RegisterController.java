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
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		RegUtility RegUtility = new RegUtility();
		int chkRegDetails = RegUtility.chkRegDetails(username, address, email, contact, password);
		HttpSession session = request.getSession();		
		if(chkRegDetails == 1){
			session.setAttribute("errorMsg", "Please fill in all the blanks");
			response.sendRedirect("register.jsp");
		} else if(chkRegDetails == 2){
			session.setAttribute("errorMsg", "Please enter a 8-digit contact number");
			response.sendRedirect("register.jsp");
		} else if(chkRegDetails == 3){
			session.setAttribute("errorMsg", "Please enter a valid email address");
			response.sendRedirect("register.jsp");
		} else if(chkRegDetails == 4){
			session.setAttribute("errorMsg", "Please provide a password with numbers and alphabets that is at least 8 characters long");
			response.sendRedirect("register.jsp");
		} else if(chkRegDetails == 5){
			session.setAttribute("errorMsg", "This email has already been used, please use another email to register");
			response.sendRedirect("register.jsp");
		} else{
			RegUtility.addRegDetails(username, address, email, contact, password);
			response.sendRedirect("registered.jsp");
		}
	}

}
