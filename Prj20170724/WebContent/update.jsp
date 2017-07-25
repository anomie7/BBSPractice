<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" import="mysqlEx.MySqlDriver"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Connection conn;
	PreparedStatement pstmt;
	final String sql = "update woori set name = ?, email= ? where id = ?";
%>

<%
	try{
		MySqlDriver mysql = new MySqlDriver();
		conn = MySqlDriver.conn;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		System.out.println("쿼리 실행");
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	location.href="selectAll.jsp";
</script>
</head>
<body>
</body>
</html>