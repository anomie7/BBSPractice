<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="mysqlEx.MySqlDriver"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	Connection conn;
	PreparedStatement pstmt;
	final String sql = "delete from woori where id = ?";
%>

<%
	try{
		MySqlDriver mysql = new MySqlDriver();
		conn = MySqlDriver.conn;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		System.out.println("쿼리 실행");
		
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
location.href = "main.html";
</script>
</body>
</html>