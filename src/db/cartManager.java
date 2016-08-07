package db;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

//java utility for managing the shopping cart

public class cartManager {
	
	//checkQuantity function returns a string to indicate how many copies of the game are left
	public String checkQuantity(int gameID, int quantity){
		try{
			Connection conn = DBConnection.getConnection();
				
			PreparedStatement pstmt=conn.prepareStatement("Select title, quantity from games where gameID = ?");
			
			pstmt.setInt(1, gameID);
		
			ResultSet rs = pstmt.executeQuery();
					
			if(rs.next()){
				if(quantity > rs.getInt("quantity")){
					return "There is only "+rs.getInt("quantity")+ (rs.getInt("quantity") ==1 ? " copy ":" copies ") +rs.getString("title")+" left.";
				}
				if(quantity <= 0){
					return "Please buy at least 1 game";
				} 
				
			}conn.close();
		}catch(Exception err) {
			System.out.println(err);
		}
		return null;
	}
	
	//checkZero returns a string indicating out of stock if there is no more copies of the game
	public String checkZero(int gameID){
		try{
			Connection conn = DBConnection.getConnection();
				
			PreparedStatement pstmt=conn.prepareStatement("Select title, quantity from games where gameID = ?");
			
			pstmt.setInt(1, gameID);
		
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt("quantity")==0){
					return "You cannot buy "+rs.getString("title")+", it is currently out of stock.";
				}
			} conn.close();
			
		}catch(Exception err) {
			System.out.println(err);
		}
		return null;
	}
	
	//insertTransaction function adds confirmed purchases into the database
	public boolean insertTransaction(HttpServletRequest request, HttpServletResponse response, String timestamp){
		try{
			HttpSession session = request.getSession();
			ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
			UserModel userdetails =(UserModel)session.getAttribute("userDetails");
			
			Connection conn = DBConnection.getConnection();
				
			//This inserts into the first table first and gets the transaction id of that transaction
			//This stores the details of the transaction
			PreparedStatement pstmt=conn.prepareStatement("insert into transaction(userID, timestamp) values (?,?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, userdetails.getUserID());
				pstmt.setString(2, timestamp);
				
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			
			int lasttransid=0;
			
			if(rs.next()){
				lasttransid = rs.getInt(1);
			}
			
			//inserting into the second table
			//This stores the game and quantity of the transaction
			for(shoppingCart shops: resultsList){
				pstmt = conn.prepareStatement("insert into transaction_game (transactionID, gameID, quantity) values (?,?,?)");
				
				pstmt.setInt(1, lasttransid);
				pstmt.setInt(2, shops.getGameID());
				pstmt.setInt(3, shops.getUserquantity());
				
				pstmt.executeUpdate();
				
				//Updates the latest quantity of the game left in stock after purchase
				pstmt = conn.prepareStatement("update games set quantity=quantity-? where gameID = ?");
				pstmt.setInt(1, shops.getUserquantity());
				pstmt.setInt(2, shops.getGameID());
				
				pstmt.executeUpdate();
			}
			conn.close();
			return true;
		}catch(Exception err) {
			err.printStackTrace();
			return false;
		}
	}
	
	//addPurchases function calls the details of the game
	public shoppingCart addPurchases(int gameID, int userquantity){
		shoppingCart shoppingCart = new shoppingCart();
		try{
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select * from games where gameID = ?");
			
			pstmt.setInt(1,gameID);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				shoppingCart.setGameID(rs.getInt("gameID"));
				shoppingCart.setCompany(rs.getString("company"));
				shoppingCart.setImageLocation(rs.getString("imageLocation"));
				shoppingCart.setPreOwned(rs.getString("preOwned"));
				shoppingCart.setPrice(rs.getDouble("price"));
				shoppingCart.setTitle(rs.getString("title"));
				shoppingCart.setQuantityDB(rs.getInt("quantity"));
				shoppingCart.setUserquantity(userquantity);
			} conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return shoppingCart;
	}
}
