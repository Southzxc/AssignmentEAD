package db;

import java.sql.*;
public class DBConnection {

	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");

		String connURL ="jdbc:mysql://188.166.238.151:3306/mkd?user=root&password=iloveeadxoxo"; 

		Connection conn =   DriverManager.getConnection(connURL);
		
		return conn;
	}
}
