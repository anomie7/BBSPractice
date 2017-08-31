package com.addrprj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.addrprj.domain.AddrVO;

public class StudentDAO {
	private static String DRV = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/test";
	private static String ID = "root";
	private static String PW = "1234";
	
	public List<AddrVO> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String selectByAll = "select *from addrBook";
		AddrVO vo = null;
		List<AddrVO> list = new ArrayList<>();
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(selectByAll);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			vo = new AddrVO();
			vo.setId(rs.getInt("id"));
			vo.setName(rs.getString("name"));
			vo.setTel(rs.getString("tel"));
			vo.setBirth(rs.getString("birth"));
			vo.setComdept(rs.getString("comdept"));
			vo.setMemo(rs.getString("memo"));
			list.add(vo);
			}
			return list;
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			close(rs, pstmt, conn);
		}
			return list;
	}
	
	public AddrVO getVO(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final String selectById = "select *from addrBook where id = ?";
		AddrVO vo = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(selectById);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			vo = new AddrVO();
			vo.setId(rs.getInt("id"));
			vo.setEmail(rs.getString("email"));
			vo.setName(rs.getString("name"));
			vo.setTel(rs.getString("tel"));
			vo.setBirth(rs.getString("birth"));
			vo.setComdept(rs.getString("comdept"));
			vo.setMemo(rs.getString("memo"));
			}
			return vo;
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			close(rs, pstmt, conn);
		}
			return vo;
	}
	
	public boolean deleteAddr(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		final String deleteAddr = "delete from addrbook where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(deleteAddr);
			pstmt.setInt(1, id);
			cnt = pstmt.executeUpdate();
			if(cnt > 0)
				return true;
			else 
				return false;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt, conn);
		}
		return false;
	}
	
	public boolean createAddr(AddrVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		final String insertAddr = "insert into addrBook (name, email, comdept, birth, tel, memo)" +
				"values(?, ?, ?, ?, ?, ?)";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(insertAddr);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getComdept());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getMemo());
			cnt = pstmt.executeUpdate();
			if(cnt > 0)
				return true;
			else
				return false;
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			close(pstmt, conn);
		}
		return false;
	}
	
	
	public boolean updateAddr(AddrVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		final String UpdateAddr = "update addrbook set name = ?, email = ?, comdept = ?, birth = ?, tel = ?, memo = ? "
									+ "where id = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(UpdateAddr);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getComdept());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getMemo());
			pstmt.setInt(7, vo.getId());
			cnt = pstmt.executeUpdate();
			if(cnt > 0)
				return true;
			else
				return false;
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			close(pstmt, conn);
		}
		return false;
	}
	
	private Connection getConnection() {
		try {
			Class.forName(DRV);
			System.out.println("드라이버 연결");
			System.out.println("유저 연결");
			return DriverManager.getConnection(url, ID, PW);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	private void close(PreparedStatement stmt, Connection conn) {
		if (stmt != null) {
			try {
				if (!stmt.isClosed())
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				stmt = null;
			}
		}

		if (conn != null) {
			try {
				if (!conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}

	private void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if (rs != null) {
			try {
				if (!rs.isClosed())
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs = null;
			}
		}

		if (stmt != null) {
			try {
				if (!stmt.isClosed())
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				stmt = null;
			}
		}

		if (conn != null) {
			try {
				if (!conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	
	
}
