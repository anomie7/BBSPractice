<%@page import="java.util.ArrayList"%>
<%@page import="dbconn.FreeBoard"%>
<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String SQL = "select id, name, subject, inputdate, readcount from freeboard order by id desc";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<FreeBoard> list = new ArrayList<>();
	int nowpage;
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			FreeBoard fb = new FreeBoard(rs.getInt("id"), rs.getString("subject"),rs.getString("name"),
					rs.getString("inputdate").substring(0, 9),rs.getInt("readcount") );
			list.add(fb);
		}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	
	if(request.getParameter("nowpage") == null) nowpage = 0;
	else nowpage = Integer.parseInt(request.getParameter("nowpage"));
	
	int row = 5;
	int cnt = list.size();
	int totalpage = cnt / row;
	if(cnt % row > 0) totalpage++;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h2>자유 게시판</h2>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<table class="table table-striped">
				<tr>
					<th class="col-xs-1">번호</th>
					<th class="text-center">제목</th>
					<th class="col-sm-2">등록자</th>
					<th class="col-xs-1" >날짜</th>
					<th class="col-xs-1">조회</th>
				</tr>
				<% 	
				if(nowpage == totalpage-1){
				for(int i = ((totalpage-1)*row); i < list.size(); i++){ %>
				<tr>
					<td><%=list.get(i).getId() %></td>
					<td><a href="/chap10/freeboard_read.jsp?id=<%=list.get(i).getId()%>&nowpage=<%=nowpage%>"><%=list.get(i).getSubject()%></a></td>
					<td><%=list.get(i).getName() %></td>
					<td><%=list.get(i).getInputdate() %></td>
					<td><%=list.get(i).getReadcount() %></td>
				</tr>
				<%} 
				}else
				for(int j = nowpage * row; j < nowpage * row + row; j++ ){ %>
				<tr>
					<td><%=list.get(j).getId() %></td>
					<td class="text-center">
					<a href="/chap10/freeboard_read.jsp?id=<%=list.get(j).getId()%>&nowpage=<%=nowpage%>">
					<%=list.get(j).getSubject()%></a></td>
					<td><%=list.get(j).getName() %></td>
					<td><%=list.get(j).getInputdate() %></td>
					<td><%=list.get(j).getReadcount() %></td>
				</tr>
				<% }%>
			</table>
			<div class="text-center">
		<a class="btn btn-primary" href="/chap10/freeboard_list.jsp?nowpage=0">처음</a>
		 <%if(nowpage == 0) {%>
		 <a class="btn btn-default" href="#">이전</a>
		 <%}else{ %>
		<a class="btn btn-primary" href="/chap10/freeboard_list.jsp?nowpage=<%=nowpage-1 %>">이전</a>
		<%} %>
		<%for(int i = 0; i < totalpage; i++){%>
		<a href="/chap10/freeboard_list.jsp?nowpage=<%=i%>"><%=i+1%></a>
		<%} %>
		<%if(nowpage == totalpage-1) {%>
		 <a class="btn btn-default" href="#">다음</a>
		 <%}else{ %>
		<a class="btn btn-primary" href="/chap10/freeboard_list.jsp?nowpage=<%=nowpage+1 %>">다음</a>
		<%} %>
		<a class="btn btn-primary" href="/chap10/freeboard_list.jsp?nowpage=<%= totalpage-1 %>">마지막</a>
		</div>
			<div class="text-center">
				<a class="btn btn-primary" href="/chap10/freeboard_write.html">글쓰기</a>
			</div>
		</div>
	</div>
</body>
</html>