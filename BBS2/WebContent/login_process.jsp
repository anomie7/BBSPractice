<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
 	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	final String SQL = "select * from member where userid = ? and password = ?";
	
	String name = null, email = null;
	boolean bLogin = false;
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			name = rs.getString("username");
			email = rs.getString("email");
			bLogin = true;
		}
	}catch(SQLException e){
		out.println(e.getMessage());
	}finally{
		if(conn != null)
			conn.close();
	}
	
	if(bLogin){
		session.setAttribute("member_id", userid);
		session.setAttribute("member_name", name);
		response.sendRedirect("index.jsp");
	}else{ %>
		<script>
			alert("아이디와 비밀번호를 확인하세요.");
			history.back();
		</script>
<%
	}
%>