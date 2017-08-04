package com.myDao.Model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	
	public void insertUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		final String SQL = "insert into member (userid ,username, password, securitynum, email, zipcode, address, phone, regedit)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		java.util.Date yymmdd = new Date();
		SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
		String regdate = myformat.format(yymmdd);
		
		try {
			conn = UserDao.getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getSecuritynum());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getZipcode());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getPhone());
			pstmt.setString(9, regdate);
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public String login(String userid, String password) {
		try{
			return findByUserId(userid, password) ? "로그인 성공" : "로그인 실패";
		}catch(PasswordMissMatchException e) {
			return "비밀번호";
		}catch(UserNotFindException e){
			return "로그인 실패";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int IdChecker(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String SQL = "select count(*) as count from member where userid = ?";
		int checkCount = 0;
		
		try{
			conn = getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			rs.next();
		    return checkCount = rs.getInt("count");
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		return checkCount;
	}

	public User getUser(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String SQL = "select * from member where userid = ?";
		
		conn = getConnect();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				return new User(rs.getString("userid"), rs.getString("username"), rs.getString("password"),
					rs.getString("email"), rs.getString("securitynum"), rs.getString("zipcode"), rs.getString("address"), rs.getString("phone"));
			else
				return null;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public int updateUser(User user) {
		String userid = user.getUserid();
		String password =  user.getPassword();
		String username = user.getUsername();
		String email = user.getEmail();
		String zipcode = user.getZipcode();
		String address = user.getAddress();
		String phone = user.getPhone();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int rs = 0;
		final String SQL = "update member set username = ?, password = ?, email = ?, zipcode = ?, address = ?, phone = ? where userid = ?";
		
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, zipcode);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, userid);
			rs = pstmt.executeUpdate();
			return rs;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}

	public int deleteUser(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		final String SQL = "delete from member where userid = ?";
		int rs = 0;
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeUpdate();
			return rs;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return rs;
		}
	}
}
