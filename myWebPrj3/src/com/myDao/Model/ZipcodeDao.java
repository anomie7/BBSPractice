package com.myDao.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ZipcodeDao {
	
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

	public Collection<Zipcode> selectZipcode(String searchaddr) {
		String sZipcode;
		String address;
		final String SQL = "select * from zipcode where dong like ?";
		
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs = null;
		Collection<Zipcode> list = new ArrayList<Zipcode>();;
		try{
			conn = getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + searchaddr + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sZipcode = rs.getString("zipcode");
				address = rs.getString("sido") + " " + rs.getString("gugun") + " " + rs.getString("dong") + " " + rs.getString("bunji");
				Zipcode zipcode = new Zipcode(sZipcode, address);
				list.add(zipcode);
			}
			return list;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return null;
		}
	}
}
