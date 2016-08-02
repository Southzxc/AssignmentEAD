package db;
import java.sql.*;
import java.util.ArrayList;

public class CheckStockUtility {
	public ArrayList<CheckStockModel> stockCheck(int stockCheck){
		ArrayList<CheckStockModel> gameDetails = new ArrayList<CheckStockModel>();
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT title, price, quantity FROM games where quantity <= ? ORDER BY 3 ASC ");
			pstmt.setInt(1, stockCheck);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				CheckStockModel CheckStockModel = new CheckStockModel();
				CheckStockModel.setTitle(rs.getString("title"));
				CheckStockModel.setPrice(rs.getDouble("price"));
				CheckStockModel.setQuantity(rs.getInt("quantity"));
				gameDetails.add(CheckStockModel);
			}
			conn.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gameDetails;
	}
}
