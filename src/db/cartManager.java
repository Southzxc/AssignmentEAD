package db;

import java.sql.*;
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
		
			System.out.println(quantity);
			
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
	
	/*public ArrayList<shoppingCart> addPurchase(int gamePurchase) {
		try{
			Class.forName("com.mysql.jdbc.Driver");

			String connURL ="jdbc:mysql://localhost/mkd?user=root&password=root"; 

			Connection conn =   DriverManager.getConnection(connURL);
			
			ArrayList<shoppingCart> cartItem= new ArrayList<shoppingCart>();
			
			PreparedStatement pstmt = conn.prepareStatement("select title, company, price, imageLocation, preOwned from games where gameID = ?");
			
			pstmt.setInt(1,gamePurchase);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				String company=rs.getString("company");
				double price = rs.getDouble("price");
				String imageLocation=rs.getString("imageLocation");
				String preOwned=rs.getString("preOwned");
				
				shoppingCart shop = new shoppingCart();
				shop.setshoppingCart(title, company, price, imageLocation, preOwned);
				cartItem.add(shop);
			}
			
			conn.close();
			return cartItem;
		}catch(Exception err) {
			System.out.println(err);
			return null;
		}
	}*/
}
