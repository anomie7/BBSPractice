package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConn {
	private final String DRV = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/member";
	private final String ID = "root";
	private final String PW = "1234";
	static public Connection conn;

	public MySqlConn() {
		try {
			Class.forName(DRV);
			System.out.println("드라이버 연결");
			conn = DriverManager.getConnection(url, ID, PW);
			System.out.println("유저 연결");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

}
