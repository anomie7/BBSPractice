<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="java.sql.*" import = "mysqlEx.MySqlDriver" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
	Connection conn;
	Statement stmt = null;
	ResultSet rs = null;
	String a = null;
	final String createTable = "create table woori (id char(10) primary key, name char(10) )";
	final String selectAll = "select * from woori";
	%>

	<%	
		MySqlDriver myDriver = new MySqlDriver();
		conn = MySqlDriver.conn;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(createTable);

		} catch (SQLException e) {
			out.println(e.getMessage());
		}
   %>
		
	<% 
		try{
		rs = stmt.executeQuery(selectAll);
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("새로운 테이블이 생성되었습니다.");
		out.println(rsmd.getColumnCount() + "개의 컬럼(필드)을 가지고 있으며");
		out.println("첫번쨰 칼럼은 " + rsmd.getColumnName(1) + "<br>");
		out.println("두번쨰 칼럼은 " + rsmd.getColumnName(2) + "<br>");
		rs.close();
		stmt.close();
		conn.close();
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	
	<a href = main.html>main 으로</a>
</body>
</html>