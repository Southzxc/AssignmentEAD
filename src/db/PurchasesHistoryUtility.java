package db;
import java.sql.*;
import java.util.ArrayList;

//PurchasesHistoryUtility consist of displayPurchses class
public class PurchasesHistoryUtility {
	
	/*
	 * displayPurchases returns an ArrayList casted with type PurchasesHistoryModel
	 * displayPurchases will accept a string parameter
	 */
	public ArrayList<PurchasesHistoryModel> displayPurchases(String userID){
		ArrayList<PurchasesHistoryModel> displayPDetails = new ArrayList<PurchasesHistoryModel>();
		
		/*
		 * Getting of purchase history from database and setting the result in the model
		 * The results are then stored in an ArrayList
		 */
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT title, tg.quantity, price, timestamp FROM games g, transaction t, transaction_game tg where g.gameID = tg.gameID and t.transactionID = tg.transactionID and userID =? order by 4 desc");
			pstmt.setString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				PurchasesHistoryModel PurchasesHistoryModel = new PurchasesHistoryModel();
				PurchasesHistoryModel.setTitle(rs.getString("title"));
				PurchasesHistoryModel.setQuantity(rs.getInt("quantity"));
				PurchasesHistoryModel.setPrice(rs.getDouble("price"));
				PurchasesHistoryModel.setDate(rs.getString("timestamp"));
				displayPDetails.add(PurchasesHistoryModel);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return displayPDetails;
		
	}
}
