<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString();
	final String sql = "insert into guestboard (name, email, subject, content, inputdate) values (?, ?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	
	try{
	MySqlConn msc = new MySqlConn();
	conn = MySqlConn.conn;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, na);
	pstmt.setString(2, em);
	pstmt.setString(3, sub);
	pstmt.setString(4, cont);
	pstmt.setString(5, ymd);
	cnt = pstmt.executeUpdate();
	
	if(cnt > 0){
		out.println("데이터가 성공적으로 입력되었습니다.");
	}else{
		out.println("데이터가 입력되지 않았습니다.");
	}
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.print(e.getMessage());
	}
%>
<% response.sendRedirect("dbgb_write.html"); %>