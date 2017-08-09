package chap09_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class GuestBoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(GuestBoardDAO.class);
	
	public Connection getConnect() {
		
		final String DRV = "com.mysql.jdbc.Driver";
		final String url = "jdbc:mysql://localhost:3306/gboard";
		final String ID = "root";
		final String PW = "1234";
		Connection conn = null;
		
		try {
			Class.forName(DRV);
			logger.debug("DB Driver 연결 완료");
			conn = DriverManager.getConnection(url, ID, PW);
			logger.debug("Connection 가져왔습니다.");
			return conn;
		} catch (ClassNotFoundException e) {
			logger.error(e.getMessage());
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		return conn;
	}

	public void insertBoard(GuestBoard gb) {
		String na = gb.getName();
		String em = gb.getEmail();
		String sub = gb.getSubject();
		String cont = gb.getContent();
		String ymd = new MyNowTime().toString();
		
		final String sql = "insert into guestboard (name, email, subject, content, inputdate) values (?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		try{
		conn = getConnect();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, na);
		pstmt.setString(2, em);
		pstmt.setString(3, sub);
		pstmt.setString(4, cont);
		pstmt.setString(5, ymd);
		cnt = pstmt.executeUpdate();
		
		if(cnt > 0){
			logger.debug("insert 성공");
		}else{
			logger.debug("insert 실패");
		}
			pstmt.close();
			conn.close();
		}catch(SQLException e){
			logger.debug(e.getMessage());
		}
	}

	public List<GuestBoard> showGuestBoard() {
		final String sql = "select *from guestboard order by inputdate desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<GuestBoard> list = new ArrayList<>();
		
		try{
		conn = getConnect();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			GuestBoard gb = new GuestBoard(rs.getString("name"), 
											rs.getString("email"), 
											rs.getString("subject"), 
											rs.getString("content"));
			gb.setYmd(rs.getString("inputdate"));
			list.add(gb);
		}
			return list;
		}catch(SQLException e){
			logger.debug(e.getMessage());
		}
		return null;
	}
}
