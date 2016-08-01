package db;

import java.io.IOException;
import java.io.PrintWriter;

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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();		
		UserModel userDetails = (UserModel)session.getAttribute("userDetails");
		String userIDdb = userDetails.getUserID();
		String emaildb = userDetails.getEmail();
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		
		ProfileUtility ProfileUtility = new ProfileUtility();
		
		int chkProfileDetails = ProfileUtility.chkProfileDetails(emaildb, username, address, email, contact);
		
		if(chkProfileDetails == 1){
			session.setAttribute("errorMsg", "Please fill in all the blanks");
		}else if(chkProfileDetails == 2){
			session.setAttribute("errorMsg", "Please enter a 8-digit contact number");
		}else if(chkProfileDetails == 3){
			session.setAttribute("errorMsg", "Please enter a valid email address");
		}else if(chkProfileDetails == 4){
			session.setAttribute("errorMsg", "This email has already been used, please use another email");
		}else{
			ProfileUtility.updtProfileDetails(userIDdb, username, address, email, contact);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("Post");
	}

}
