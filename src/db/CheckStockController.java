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
 * Servlet implementation class CheckStockController
 */
@WebServlet("/CheckStockController")
public class CheckStockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckStockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * This controller will get the input of stock check and pass it to check stock utility to get the stock and game details from DB
		 * Results are stored in an ArrayList and set into a session named gameDetails
		 * It will then redirect to stockCheck.jsp 
		 */
		int stockCheck = Integer.parseInt(request.getParameter("stockCheck"));
		CheckStockUtility CheckStockUtility = new CheckStockUtility();
		ArrayList<CheckStockModel> gameDetails = CheckStockUtility.stockCheck(stockCheck);
		HttpSession session = request.getSession();
		session.setAttribute("gameDetails", gameDetails);
		response.sendRedirect("stockCheck.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
