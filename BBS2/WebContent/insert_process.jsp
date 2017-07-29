<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String userid = request.getParameter("userid");
	String password =  request.getParameter("password");
	String username = request.getParameter("username");
	String securitynum = request.getParameter("securitynum");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");

	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	final String SQL = "insert into member (userid ,username, password, securitynum, email, zipcode, address, phone, regedit)"
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
%>

<%
	java.util.Date yymmdd = new Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String regdate = myformat.format(yymmdd);
	
	try {
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid);
		pstmt.setString(2, username);
		pstmt.setString(3, password);
		pstmt.setString(4, securitynum);
		pstmt.setString(5, email);
		pstmt.setString(6, zipcode);
		pstmt.setString(7, address);
		pstmt.setString(8, phone);
		pstmt.setString(9, regdate);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		out.print(e.getMessage());
	}
%>