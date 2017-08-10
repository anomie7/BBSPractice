<%@page import="dbconn.MySqlConn"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String SQL = "update freeboard set name = ?, email= ?, subject = ?, content = ? where id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	int id = Integer.parseInt(request.getParameter("id"));
	int rs = 0;
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("email"));
		pstmt.setString(3, request.getParameter("subject"));
		pstmt.setString(4, request.getParameter("content"));
		pstmt.setInt(5, id);
		rs = pstmt.executeUpdate();
		if(rs == 0) out.print("업데이트에 실패하였습니다.");
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.print(e.getMessage());
	}
%>
<%  response.sendRedirect("freeboard_read.jsp?id="+request.getParameter("id") + "&nowpage=" + request.getParameter("nowpage"));%>