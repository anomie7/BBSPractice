<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String userid = request.getParameter("userid");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	final String SQL = "select count(*) as count from member where userid = ?";
	
	int checkCount = 0;
	String canUse = "사용할 수 있는 아이디입니다.";
	String canNotUse = "사용할 수 없는 아이디입니다.";
%>

<%	
	try{
	MySqlConn msc = new MySqlConn();
	conn = MySqlConn.conn;
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, userid);
	rs = pstmt.executeQuery();
	rs.next();
    checkCount = rs.getInt("count");
	rs.close();
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>

<% 
	if(checkCount == 0){
%>
	<%= canUse %>
<%
	}else{
%>		
	<%= canNotUse %>
<%	
	}

%>
