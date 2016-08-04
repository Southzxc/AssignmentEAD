package db;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PurchasesHistoryController
 */
@WebServlet("/PurchasesHistoryController")
public class PurchasesHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchasesHistoryController() {
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
		String userID = userDetails.getUserID();
		PurchasesHistoryUtility PurchasesHistoryUtility = new PurchasesHistoryUtility();
		ArrayList<PurchasesHistoryModel> displayPDetails = PurchasesHistoryUtility.displayPurchases(userID);
		session.setAttribute("displayPDetails", displayPDetails);
		response.sendRedirect("purchaseHistory.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
