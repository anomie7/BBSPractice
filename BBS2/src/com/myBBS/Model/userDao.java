package com.myBBS.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class userDao {

	
	public static Connection getConnect() {
		final String DRV = "com.mysql.jdbc.Driver";
		final String url = "jdbc:mysql://localhost:3306/member";
		final String ID = "root";
		final String PW = "1234";
		Connection conn = null;
		
		try {
			Class.forName(DRV);
			System.out.println("드라이버 연결");
			conn = DriverManager.getConnection(url, ID, PW);
			System.out.println("유저 연결");
			return conn;
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
}
