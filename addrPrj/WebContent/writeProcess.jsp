<%@page import="java.sql.SQLException"%>
<%@page import="com.addrprj.util.JDBCUtill"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt = 0;
	final String insertAddr = "insert into addrBook (name, email, comdept, birth, tel, memo)" +
			"values(?, ?, ?, ?, ?, ?)";
	try{
		conn = JDBCUtill.getConnection();
		pstmt = conn.prepareStatement(insertAddr);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("email"));
		pstmt.setString(3, request.getParameter("comdept"));
		pstmt.setString(4, request.getParameter("birth"));
		pstmt.setString(5, request.getParameter("tel"));
		pstmt.setString(6, request.getParameter("memo"));
		cnt = pstmt.executeUpdate();
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtill.close(pstmt, conn);
	}
	
	response.sendRedirect("addr_list.jsp");
%>