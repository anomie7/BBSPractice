<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String delete = "delete from freeboard where id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	int id = Integer.parseInt(request.getParameter("id"));
	
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(delete);
		pstmt.setInt(1, id);
		rs = pstmt.executeUpdate();
		if(rs == 0){
			out.println("존재하지 않는 게시물입니다.");
			response.sendRedirect("/chap10/freeboard_write.html");
		}else{
			response.sendRedirect("/chap10/freeboard_list.jsp");
		}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>