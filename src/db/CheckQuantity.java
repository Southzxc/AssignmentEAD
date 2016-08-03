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
 * Servlet implementation class CheckQuantity
 */
@WebServlet("/CheckQuantity")
public class CheckQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckQuantity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		String over = null;
		
		
		
		for(shoppingCart shops: resultsList){
			cartManager cm = new cartManager();
			
			 over = cm.checkQuantity(shops.getGameID(), shops.getQuantity());
			 if(over!=null){
					session.setAttribute("limit", over);
					response.sendRedirect("cart.jsp");
					return;
			}
		}
		response.sendRedirect("confirmPurchases.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
