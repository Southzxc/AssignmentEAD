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
		
		
		//Checks if the user buying is a member
		if(session.getAttribute("userDetails")==null){
			session.setAttribute("errorMsg", "Please login to buy");
			response.sendRedirect("index.jsp");
			return;
		}
		
		//Parameters that are parse in by the form
		int gameID = Integer.parseInt(request.getParameter("gameID"));
		int userquantity = Integer.parseInt(request.getParameter("quantity"));
		
		//Gets the arraylist session and store into resultsList
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		
		//Creates a new array list if there is no session
		if(resultsList==null) {
			resultsList=new ArrayList<shoppingCart>();
		}
		
		//Calling the cartmanager utility
		cartManager cm = new cartManager();
		
		//Check if the game have any stocks left
		String nogame = cm.checkZero(gameID);
		
		if(nogame!=null){
			session.setAttribute("errorMsg", nogame);
			response.sendRedirect("gameDetails.jsp?gameID="+gameID);
			return;
		}
		
		//If there is already a game in shopping list, buying the game again will just increase the quantity purchased by 1
		for(shoppingCart shops:resultsList){
			if(gameID==shops.getGameID()){
				shops.setUserquantity(shops.getUserquantity()+1);
				response.sendRedirect("cart.jsp");
				return;
			}
		}
		
		//Assigning a new java bean
		shoppingCart sc = new shoppingCart();
		
		//Calls addPurchases function to get the selected game's information
		sc = cm.addPurchases(gameID,userquantity);
		
		//Adds the addPurchases function into resultsList
		resultsList.add(sc);
		
		//Sets the session
		session.setAttribute("results", resultsList);
		
		//Redirect users to cart
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
