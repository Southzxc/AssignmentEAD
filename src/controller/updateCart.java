package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.shoppingCart;

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

		int scgid = Integer.parseInt(request.getParameter("scgid"));
		int gameID = Integer.parseInt(request.getParameter("gameID"));
		String title = request.getParameter("title");
		String company = request.getParameter("company");
		double price = Double.parseDouble(request.getParameter("price"));
		String imageLocation=request.getParameter("imageLocation");
		String preOwned=request.getParameter("preOwned");
		int number = Integer.parseInt(request.getParameter("number"));
		
		HttpSession session = request.getSession();
		ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		
		resultsList.remove(scgid);
		
		shoppingCart sc = new shoppingCart();
		sc.setshoppingCart(gameID,title, company, price, imageLocation, preOwned, number);
		
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
