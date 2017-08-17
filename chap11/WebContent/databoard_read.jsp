<%@page import="dbconn.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%
	final String SQL = "select * from databoard where id = ?";
	final String updateReadCount = "update databoard set readcount = ? where id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	dataBoard db = null;
	String nowpage;
	if(request.getParameter("nowpage") == null){
		nowpage = "0";
	}else{
		nowpage = request.getParameter("nowpage");
	}
	
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if(!rs.next()) response.sendRedirect("/chap11/databoard_list.jsp");
		
		db = new dataBoard(rs.getString("name"), rs.getString("inputdate"), 
					rs.getInt("readcount"), rs.getString("content"), rs.getString("subject"), rs.getString("filename"));
		pstmt.close();
		pstmt = conn.prepareStatement(updateReadCount);
		pstmt.setInt(1, db.getReadcount() + 1);
		pstmt.setInt(2, id);
		pstmt.executeUpdate();
		db.setReadcount(db.getReadcount() + 1);
	}catch(SQLException e){
		out.print(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
%>
<style>
pre {border: 0; background-color: transparent;}
</style>
<script>
function delecheck(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "/chap11/databoard_del.jsp?id=<%=id%>&nowpage=<%=nowpage%>";
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>조회</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<table class="table table-striped">
				<tr>
					<td>이름</td>
					<td><%=db.getName()%></td>
				</tr>
				<tr>
					<td>조회</td>
					<td><%=db.getReadcount()%></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><%=db.getFilename()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=db.getInputdate()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=db.getSubject()%></td>
				</tr>
				<tr>
					<td colspan="2">
					<pre><code><%=db.getContent()%></code></pre>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			<div class="text-right">
				<a class="btn btn-primary" href="/chap11/databoard_rwrite.jsp?id=<%=id%>&nowpage=<%=nowpage%>">답글</a>
				<a class="btn btn-primary" href="/chap11/databoard_upd.jsp?id=<%=id%>&nowpage=<%=nowpage%>">수정</a>
				<a class="btn btn-primary" onclick="delecheck()">삭제</a>
				<a class="btn btn-primary" href="/chap11/databoard_list.jsp?nowpage=<%=nowpage%>">목록으로</a>
			</div>
		</div>
	</div>
</body>
</html>