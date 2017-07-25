package mysqlEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlDriver {
	private final String DRV= "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/gboard";
	private final String ID = "root";
	private final String PW = "1234";
	static public Connection conn;
	
	public MySqlDriver() {
		try {
			Class.forName(DRV);
			conn = DriverManager.getConnection(url, ID, PW);
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	
	
}
