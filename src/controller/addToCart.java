package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.cartManager;
import model.shoppingCart;

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

		int gameID = Integer.parseInt(request.getParameter("gameID"));
		String title = request.getParameter("title");
		String company = request.getParameter("company");
		double price = Double.parseDouble(request.getParameter("price"));
		String imageLocation=request.getParameter("imageLocation");
		String preOwned=request.getParameter("preOwned");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		HttpSession session = request.getSession();
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		
		if(resultsList==null) {
			resultsList=new ArrayList<shoppingCart>();
		}
		
		for(shoppingCart shops:resultsList){
			if(gameID==shops.getGameID()){
				shops.setQuantity(shops.getQuantity()+1);
				response.sendRedirect("cart.jsp");
				return;
			}
		}
		
		shoppingCart sc = new shoppingCart();
		sc.setshoppingCart(gameID,title, company, price, imageLocation, preOwned, quantity);
		
		
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
