package com.myDao.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.myException.PasswordMissMatchException;
import com.myException.UserNotFindException;

public class UserDao {

	private static final Exception UserNotFindException = null;

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

	public boolean findByUserId(String userid, String password) throws Exception {
		// 모델
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String SQL = "select * from member where userid = ?";

		try {
			conn = UserDao.getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(!rs.getString("password").equals(password)) {
					throw new PasswordMissMatchException();
				}
				return true;
			}else {
				throw new UserNotFindException();
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
}
