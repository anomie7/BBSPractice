<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="chap09_model.GuestBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	List<GuestBoard> list = new ArrayList<>();

	int where = 1;
	if(request.getParameter("go") != null)
		where = Integer.parseInt(request.getParameter("go"));
	int nextpage = where + 1;
	int priorpage = where - 1;
	int startrow = 0;
	int endrow = 0;
	int maxrows = 2;
	int totalrows = 0;
	int totalpages = 0;

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
	<%if(!rs.next()){ %>
	<h1>게시글이 없습니다.</h1>
	<%}else{ %>
	<div class="container">
		<div class="page-header">
			<h2>조회</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
		<% 
			do{
				GuestBoard gb = new GuestBoard(rs.getString("name"), 
												rs.getString("email"), 
												rs.getString("subject"), 
												rs.getString("content"));
				gb.setYmd(rs.getString("inputdate"));
				list.add(gb);
			}while(rs.next());
		
			totalrows = list.size();
			totalpages = totalrows / maxrows;
			if(totalrows % maxrows > 0) totalpages++;
			
			startrow = (where - 1) * maxrows;
			endrow = startrow + maxrows - 1;
			if(endrow >= totalrows) endrow = totalrows -1;
			
			for(int j = startrow; j <= endrow; j++){
		%>
		 <table class="table table-striped">
            <tr>
                <td>이름</td>
                <td><%=list.get(j).getName() %></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><%= list.get(j).getEmail() %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%= list.get(j).getYmd() %></td>
            </tr>
            <tr>
                <td colspan="2">
                <pre><code><%= list.get(j).getContent() %></code></pre>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
           </table>
	<%} rs.close(); pstmt.close(); conn.close(); }%>
		</div>
	</div>
		<div class="text-center">
		<%if(where > 1){ %>
			<a class="btn btn-primary" href="/chap09/dbgb_show.jsp?go=1">처음</a>
			<a class="btn btn-primary" href="/chap09/dbgb_show.jsp?go=<%= priorpage%>">이전</a>
		<%}else{ %>
			<a class="btn btn-default" href="#" >처음</a>	
			<a class="btn btn-default" href="#" >이전</a>	
		<%} %>
		<%
			for(int i = 1; i <= totalpages; i++){
		%>
			<a href="/chap09/dbgb_show.jsp?go=<%=i%>"><%=i %></a>
		<%} %>
		<%if(where < totalpages){%>
			<a class="btn btn-primary" href="/chap09/dbgb_show.jsp?go=<%=nextpage%>">다음</a>
			<a class="btn btn-primary" href="/chap09/dbgb_show.jsp?go=<%=totalpages%>">마지막</a>
			<%}else{%>
			<a class="btn btn-default" href="#">다음</a>	
			<a class="btn btn-default" href="#">마지막</a>		
			<% }%>
			<%= where + "/" + totalpages %>
		</div>
		<div class="text-center">
			<a class="btn btn-primary" href="/chap09/dbgb_write.html">글쓰기</a>
		</div>
</body>

</html>