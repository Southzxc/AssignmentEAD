package db;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;


public class cartManager {
	
	public String checkQuantity(int gameID, int quantity){
		try{
			Class.forName("com.mysql.jdbc.Driver");

			String connURL ="jdbc:mysql://13.67.63.213/mkd?user=root&password=iloveeadxoxo"; 

			Connection conn =   DriverManager.getConnection(connURL);
				
			PreparedStatement pstmt=conn.prepareStatement("Select title, quantity from games where gameID = ?");
			
			pstmt.setInt(1, gameID);
		
			ResultSet rs = pstmt.executeQuery();
					
			if(rs.next()){
				if(quantity > rs.getInt("quantity")){
					return "There is only "+rs.getInt("quantity")+ (rs.getInt("quantity") ==1 ? " copy ":" copies ") +rs.getString("title")+" left.";
				}
			}conn.close();
		}catch(Exception err) {
			System.out.println(err);
		}
		return null;
	}
	
	public String checkZero(int gameID){
		try{
			Class.forName("com.mysql.jdbc.Driver");

			String connURL ="jdbc:mysql://13.67.63.213/mkd?user=root&password=iloveeadxoxo"; 

			Connection conn =   DriverManager.getConnection(connURL);
				
			PreparedStatement pstmt=conn.prepareStatement("Select title, quantity from games where gameID = ?");
			
			pstmt.setInt(1, gameID);
		
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getInt("quantity")==0){
					return "You cannot buy "+rs.getString("title")+", it is currently out of stock.";
				}
			}
			
		}catch(Exception err) {
			System.out.println(err);
		}
		return null;
	}
	
	public boolean insertTransaction(HttpServletRequest request, HttpServletResponse response, String timestamp){
		try{
			HttpSession session = request.getSession();
			ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
			UserModel userdetails =(UserModel)session.getAttribute("userDetails");
			
			Connection conn = DBConnection.getConnection();
				
			PreparedStatement pstmt=conn.prepareStatement("insert into transaction(userID, timestamp) values (?,?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, userdetails.getUserID());
				pstmt.setString(2, timestamp);
				
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			
			int lasttransid=0;
			
			if(rs.next()){
				lasttransid = rs.getInt(1);
			}
			
			for(shoppingCart shops: resultsList){
				pstmt = conn.prepareStatement("insert into transaction_game (transactionID, gameID, quantity) values (?,?,?)");
				
				pstmt.setInt(1, lasttransid);
				pstmt.setInt(2, shops.getGameID());
				pstmt.setInt(3, shops.getUserquantity());
				
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement("update games set quantity=quantity-? where gameID = ?");
				pstmt.setInt(1, shops.getUserquantity());
				pstmt.setInt(2, shops.getGameID());
				
				pstmt.executeUpdate();
			}
			
			return true;
		}catch(Exception err) {
			err.printStackTrace();
			return false;
		}
	}
	
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
				shoppingCart.setPrice(rs.getInt("price"));
				shoppingCart.setTitle(rs.getString("title"));
				shoppingCart.setQuantityDB(rs.getInt("quantity"));
				shoppingCart.setUserquantity(userquantity);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return shoppingCart;
	}
}
