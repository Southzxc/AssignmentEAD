package db;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("userDetails")==null){
			session.setAttribute("login", "Please login to buy");
			response.sendRedirect("index.jsp");
			return;
		}
		
		int gameID = Integer.parseInt(request.getParameter("gameID"));
		int userquantity = Integer.parseInt(request.getParameter("quantity"));
		
		
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		
		if(resultsList==null) {
			resultsList=new ArrayList<shoppingCart>();
		}
		
		cartManager cm = new cartManager();
		String nogame = cm.checkZero(gameID);
		
		if(nogame!=null){
			session.setAttribute("nogame", nogame);
			response.sendRedirect("gameDetails.jsp?gameID="+gameID);
			return;
		}
		
		for(shoppingCart shops:resultsList){
			if(gameID==shops.getGameID()){
				shops.setUserquantity(shops.getUserquantity()+1);
				response.sendRedirect("cart.jsp");
				return;
			}
		}
		
		shoppingCart sc = new shoppingCart();
		
		sc = cm.addPurchases(gameID,userquantity);
		
		resultsList.add(sc);
		
		session.setAttribute("results", resultsList);
		
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
