<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="mysqlEx.MySqlDriver"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection conn;
	Statement stmt = null;
	ResultSet rs = null;
	String a = null;
	final String selectAll = "select * from woori";%>

	<%
		MySqlDriver myDriver = new MySqlDriver();
		conn = MySqlDriver.conn;
		try {
			stmt = conn.createStatement();

		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	%>
	
	<%	
		try{
		stmt = conn.createStatement();
		stmt.executeUpdate("alter table woori add email char(30)" );
		stmt.executeUpdate("alter table woori add password integer");
		stmt.executeUpdate("alter table woori change column 'name' char(20) not null");
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	
	
	try{
		rs = stmt.executeQuery(selectAll);
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("테이블이 수정되었습니다.");
		out.println(rsmd.getColumnCount() + "개의 컬럼(필드)을 가지고 있으며");
		
		for(int i = 1; i <= rsmd.getColumnCount(); i++){
			out.println(i + "번쨰 칼럼은 " + rsmd.getColumnName(i));
			out.println("이고 유형은 " + rsmd.getColumnType(i));
			out.println("이며 크기는 " + rsmd.getPrecision(i) + "<BR>");
		}
		rs.close();
		stmt.close();
		conn.close();
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	
	

</body>
</html>