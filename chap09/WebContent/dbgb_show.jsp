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
</head>
<body>
<% while(rs.next()) {%>
	<div class="container">
		<div class="page-header">
			<h2>블로그</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form name="filegbwrite" method="post" action="dbgb_save.jsp">
				<h3>조회</h3>
				<div class="form-group">
					<label for="input1">이름</label> 
					<input type="text" class="form-control" id="input1" name="name" value="<%=rs.getString("name") %>">
				</div>
				<div class="form-group">
					<label for="input2">E-mail</label>
					 <input type="email" class="form-control" id="input2" name="email" value="<%=rs.getString("email") %>">
				</div>
				<div class="form-group">
					<label for="input3">제목</label> 
					<input type="text" class="form-control" id="input3" name="subject" value="<%=rs.getString("subject") %>">
				</div>
				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea class="form-control" id="textarea1" name="content"
						rows="10" cols="40"><%=rs.getString("content")%></textarea>
				</div>
			</form>
		</div>
	</div>
	<%} %>
</body>

</html>