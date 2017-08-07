<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String sql = "select *from guestboard order by inputdate desc";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
	MySqlConn msc = new MySqlConn();
	conn = MySqlConn.conn;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	}catch(SQLException e){
		out.print(e.getMessage());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		pre {border: 0; background-color: transparent;}
	</style>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>조회</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
		<% while(rs.next()) {%>
		 <table class="table table-striped">
            <tr>
                <td>이름</td>
                <td><%=rs.getString("name") %></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><%= rs.getString("email") %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%= rs.getString("inputdate") %></td>
            </tr>
            <tr>
                <td colspan="2">
                <pre><code><%= rs.getString("content") %></code></pre>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
           </table>
	<%} %>
		</div>
	</div>
		<div class="text-center">
			<a class="btn btn-primary" href="/chap09/dbgb_write.html">글쓰기</a>
		</div>
</body>

</html>