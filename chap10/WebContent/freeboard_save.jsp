<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconn.NowTime" %>
<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String pw = request.getParameter("password");
	NowTime nt = new NowTime();
	String ymd  = nt.toString();
	
	int id = 1;
	int pos = 0;
	
	if(cont.length() == 1) cont = cont + " ";
	
	while( (pos = cont.indexOf(" \" ", pos)) != -1){
		String left = cont.substring(0, pos);
		String right = cont.substring(pos, cont.length());
		cont = left + "\\" +  right;
		pos += 2;
	} 
	
	final String selectMaxId = "select max(id) from freeboard";
	final String insertSQL = "insert into freeboard(id, name, password, email, subject"
							 + ",content, inputdate, masterid) " 
							 + "values(?, ?, ?, ?, ?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(selectMaxId);
		rs = pstmt.executeQuery();
		
		if(!(rs.next() )) id = 1;
		else {
			id = rs.getInt(1) + 1;
			rs.close();
		}
		pstmt = conn.prepareStatement(insertSQL);
		pstmt.setInt(1, id);
		pstmt.setString(2, na);
		pstmt.setString(3, pw);
		pstmt.setString(4, em);
		pstmt.setString(5, sub);
		pstmt.setString(6, cont);
		pstmt.setString(7, ymd);
		pstmt.setInt(8, id);
		
		cnt = pstmt.executeUpdate();
		if(cnt > 0) out.println("데이터가 성공적으로 입력되었습니다.");
		else out.println("데이터가 입력되지 않았습니다.");
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.print(e.getMessage());
	}
	
	response.sendRedirect("freeboard_write.html");
%>