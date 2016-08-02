package db;

import java.sql.*;
import java.util.*;


public class cartManager {
	
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
