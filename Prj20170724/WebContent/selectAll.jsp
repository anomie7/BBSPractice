<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="mysqlEx.MySqlDriver"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>모든 회원 조회</title>
</head>
<body>
	<%
		Connection conn;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MySqlDriver mySqlDriver = new MySqlDriver();
		conn = MySqlDriver.conn;
		
		pstmt = conn.prepareStatement("select *from woori");
		rs = pstmt.executeQuery();
	%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">데이터베이스 학습</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.html">Home</a></li>
				<li><a href="create.jsp">테이블 만들기</a></li>
				<li><a href="alter.jsp">테이블 수정하기</a></li>
				<li><a href="insert.html">회원 추가하기</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 조회하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="selectAll.jsp">전체 회원 조회</a></li>
						<li><a href="select.html">개별 회원 조회</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
	<h2>우리 회원 정보 보기</h2>
	<table class="table table-striped">
		<thead>
		<tr>
			<th>사용자 ID</th>
			<th>이름</th>
			<th>E-mail</th>
		</tr>
		</thead>
		<tbody>
		<%
			if(!rs.next()){
		%>
			<h1>조회되는 회원이 없습니다.</h1>
		<%
			}else{
		 	
			do{
				%>
				<tr>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("email") %></td>
				</tr>
				<%
					}while(rs.next());
				}
				%>
				</tbody>
	</table>
	<a class="btn btn-primary" href="main.html">main으로</a>
	<a class="btn btn-primary" href="insert.html">회원 등록 페이지로</a>
	</div>
</body>
</html>