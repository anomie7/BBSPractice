<%@page import="java.util.ArrayList"%>
<%@page import="dbconn.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String SQL = "select * from databoard order by masterid desc, replynum, step, id";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<dataBoard> list = new ArrayList<>();
	int nowpage;
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			dataBoard db = new dataBoard(rs.getInt("id"), rs.getString("subject"),rs.getString("name"),
					rs.getString("inputdate").substring(0, 9),rs.getInt("readcount"),rs.getInt("step"), rs.getString("filename"));
			list.add(db);
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
<script>
function check(){
	with(document.megsearch){
		if(sval.value.length == 0){
			alert("검색어를 입력해주세요!");
			sval.focus();
			return false;
		}
		document.megsearch.submit();
	}
}

</script>
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
					<th class="col-sm-3" >첨부파일</th>
					<th class="col-xs-1">조회</th>
				</tr>
				<% 	
				if(nowpage == totalpage-1){
				for(int i = ((totalpage-1)*row); i < list.size(); i++){ %>
				<tr>
					<td><%=list.get(i).getId() %></td>
					<%if(list.get(i).getStep() > 0){ %>
					<td class="text-left">
					<a href="/chap11/databoard_read.jsp?id=<%=list.get(i).getId()%>&nowpage=<%=nowpage%>">
					<%for(int k = 0; k < list.get(i).getStep(); k++){ out.print("&nbsp;&nbsp;");}%>
					<%=list.get(i).getSubject()%></a></td>
					<%}else{ %>
					<td class="text-left">
					<a href="/chap11/databoard_read.jsp?id=<%=list.get(i).getId()%>&nowpage=<%=nowpage%>">
					<%=list.get(i).getSubject()%></a></td>
					<%} %>
					<td><%=list.get(i).getName() %></td>
					<td><%=list.get(i).getInputdate() %></td>
					<%
					if(list.get(i).getFilename() != null){ %>
					<td><a href="down.jsp?file=<%=list.get(i).getFilename()%>"><%=list.get(i).getFilename() %></a></td>
					<%}else{ %>
					<td><%=list.get(i).getFilename() %></td>
					<%}%>
					<td><%=list.get(i).getReadcount() %></td>
				</tr>
				<%} 
				}else
				for(int j = nowpage * row; j < nowpage * row + row; j++ ){ %>
				<tr>
					<td><%=list.get(j).getId() %></td>
					<%if(list.get(j).getStep() > 0){ %>
					<td class="text-left">
					<a href="/chap11/databoard_read.jsp?id=<%=list.get(j).getId()%>&nowpage=<%=nowpage%>">
					<%for(int i = 0; i < list.get(j).getStep(); i++){ out.print("&nbsp;&nbsp;");}%>
					<%=list.get(j).getSubject()%></a></td>
					<%}else{ %>
					<td class="text-left">
					<a href="/chap11/databoard_read.jsp?id=<%=list.get(j).getId()%>&nowpage=<%=nowpage%>">
					<%=list.get(j).getSubject()%></a></td>
					<%} %>
					<td><%=list.get(j).getName() %></td>
					<td><%=list.get(j).getInputdate() %></td>
					<%
					if(list.get(j).getFilename() != null){ %>
					<td><a href="down.jsp?file=<%=list.get(j).getFilename()%>"><%=list.get(j).getFilename() %></a></td>
					<%}else{ %>
					<td><%=list.get(j).getFilename() %></td>
					<%}%>
					<td><%=list.get(j).getReadcount()%></td>
				</tr>
				<% }%>
			</table>
			<div class="text-center">
		<a class="btn btn-primary" href="/chap11/databoard_list.jsp?nowpage=0">처음</a>
		 <%if(nowpage == 0) {%>
		 <a class="btn btn-default" href="#">이전</a>
		 <%}else{ %>
		<a class="btn btn-primary" href="/chap11/databoard_list.jsp?nowpage=<%=nowpage-1 %>">이전</a>
		<%} %>
		<%for(int i = 0; i < totalpage; i++){%>
		<a href="/chap11/databoard_list.jsp?nowpage=<%=i%>"><%=i+1%></a>
		<%} %>
		<%if(nowpage == totalpage-1) {%>
		 <a class="btn btn-default" href="#">다음</a>
		 <%}else{ %>
		<a class="btn btn-primary" href="/chap11/databoard_list.jsp?nowpage=<%=nowpage+1 %>">다음</a>
		<%} %>
		<a class="btn btn-primary" href="/chap11/databoard_list.jsp?nowpage=<%= totalpage-1 %>">마지막</a>
		</div>
			<div class="text-center">
				<a class="btn btn-primary" href="/chap10/databoard_write.html">글쓰기</a>
			</div>
		<div class="text-center">
			<form method="post" name="megsearch" action="databoard_search.jsp">
				<span class="col-sm-4">
				<select class="form-control" name="stype">
						<option value="1">이름</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
						<option value="4">이름 + 제목</option>
						<option value="5">이름 + 내용</option>
						<option value="6">제목 + 내용</option>
						<option value="7">이름 + 제목 + 내용</option>
					</select>
				</span>
				<div class="input-group col-md-6">
 				<input type="text" name="sval" class="form-control" placeholder="검색 키워드를 입력하세요!">
  				<span class="input-group-btn">
					<button class="btn btn-secondary" onClik="check()">찾기</button>
  				</span>
  				</div>
			</form>
		</div>
		</div>
	</div>
</body>
<% JDBCUtil.close(rs, pstmt, conn); %>
</html>