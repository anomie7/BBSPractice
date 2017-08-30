<%@page import="java.sql.SQLException"%>
<%@page import="com.addrprj.util.JDBCUtill"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	final String deleteAddr = "delete from addrbook where id = ?";
	try {
		conn = JDBCUtill.getConnection();
		pstmt = conn.prepareStatement(deleteAddr);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
		cnt = pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} finally {
		JDBCUtill.close(pstmt, conn);
	}
	response.sendRedirect("addr_list.jsp");
%>