package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class updateCart
 */
@WebServlet("/updateCart")
public class updateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		//This updates the amount of quantity the user wants to buy
		int scgid = Integer.parseInt(request.getParameter("scgid"));
		int gameID = Integer.parseInt(request.getParameter("gameID"));
		int number = Integer.parseInt(request.getParameter("number"));
		
		HttpSession session = request.getSession();
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		
		resultsList.remove(scgid);
		
		cartManager cm = new cartManager();
		shoppingCart sc = new shoppingCart();
		sc = cm.addPurchases(gameID,number);
		
		resultsList.add(sc);
		
		response.sendRedirect("cart.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
