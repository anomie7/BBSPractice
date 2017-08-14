<%@page import="java.util.ArrayList"%>
<%@page import="dbconn.FreeBoard"%>
<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String sql = "select * from freeboard ";
	String cond = null;
	String cond2;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<FreeBoard> list = new ArrayList<>();
	int what = 1;
	String val = null;

	if (request.getParameter("stype") != null) {
		what = Integer.parseInt(request.getParameter("stype"));
		val = request.getParameter("sval");

		if (what == 1) {
			cond = " where name like ?";
		}

		if (what == 2) {
			cond = " where subject like ?";
		}

		if (what == 3) {
			cond = " where content like ?";
		}

		if (what == 4) {
			cond = " where name like ? or subject like ?";
		}

		if (what == 5) {
			cond = " where name like ? or content like ?";
		}

		if (what == 6) {
			cond = " where subject like ? or content like ?";
		}

		if (what == 7) {
			cond = " where name like ? or subject like ? or content like ?";
		}

		if (val.trim().equals(""))
			cond = "";
	}else{
		response.sendRedirect("freeboard_list.jsp");
	}
	
	if (what < 4) {
		try {
			cond2 = "%" + val + "%";
			sql = sql + cond;
			MySqlConn msc = new MySqlConn();
			conn = MySqlConn.conn;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cond2);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FreeBoard fb = new FreeBoard(rs.getInt("id"), rs.getString("subject"), rs.getString("name"),
						rs.getString("inputdate").substring(0, 9), rs.getInt("readcount"), rs.getInt("step"));
				list.add(fb);
			}
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	} else if (what < 7) {
		try {
			cond2 = "%" + val + "%";
			sql = sql + cond;
			MySqlConn msc = new MySqlConn();
			conn = MySqlConn.conn;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cond2);
			pstmt.setString(2, cond2);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FreeBoard fb = new FreeBoard(rs.getInt("id"), rs.getString("subject"), rs.getString("name"),
						rs.getString("inputdate").substring(0, 9), rs.getInt("readcount"), rs.getInt("step"));
				list.add(fb);
			}
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	} else if (what == 7) {
		try {
			cond2 = "%" + val + "%";
			sql = sql + cond;
			MySqlConn msc = new MySqlConn();
			conn = MySqlConn.conn;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cond2);
			pstmt.setString(2, cond2);
			pstmt.setString(3, cond2);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FreeBoard fb = new FreeBoard(rs.getInt("id"), rs.getString("subject"), rs.getString("name"),
						rs.getString("inputdate").substring(0, 9), rs.getInt("readcount"), rs.getInt("step"));
				list.add(fb);
			}
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
	}
%>
<%
	//페이징 처리
	int nowpage;

	if (request.getParameter("nowpage") == null)
		nowpage = 0;
	else
		nowpage = Integer.parseInt(request.getParameter("nowpage"));

	int row = 5;
	int cnt = list.size();
	int totalpage = cnt / row;
	if (cnt % row > 0)
		totalpage++;
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
					<th class="col-xs-1">날짜</th>
					<th class="col-xs-1">조회</th>
				</tr>
				<%
					if (nowpage == totalpage - 1) {
						for (int i = ((totalpage - 1) * row); i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td class="text-left"><a
						href="/chap10/freeboard_read.jsp?id=<%=list.get(i).getId()%>&nowpage=<%=nowpage%>">
							<%=list.get(i).getSubject()%></a></td>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getInputdate()%></td>
					<td><%=list.get(i).getReadcount()%></td>
				</tr>
				<%
					}
					} else
						for (int j = nowpage * row; j < nowpage * row + row; j++) {
				%>
				<tr>
					<td><%=list.get(j).getId()%></td>
					<td class="text-left"><a
						href="/chap10/freeboard_read.jsp?id=<%=list.get(j).getId()%>&nowpage=<%=nowpage%>">
							<%=list.get(j).getSubject()%></a></td>
					<td><%=list.get(j).getName()%></td>
					<td><%=list.get(j).getInputdate()%></td>
					<td><%=list.get(j).getReadcount()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<div class="text-center">
				<a class="btn btn-primary"
					href="/chap10/freeboard_search.jsp?nowpage=0&stype=<%=what%>&sval=<%=val%>">처음</a>
				<%
					if (nowpage == 0) {
				%>
				<a class="btn btn-default" href="#">이전</a>
				<%
					} else {
				%>
				<a class="btn btn-primary"
					href="/chap10/freeboard_search.jsp?nowpage=<%=nowpage - 1%>&stype=<%=what%>&sval=<%=val%>">이전</a>
				<%
					}
				%>
				<%
					for (int i = 0; i < totalpage; i++) {
				%>
				<a href="/chap10/freeboard_search.jsp?nowpage=<%=i%>"><%=i + 1%></a>
				<%
					}
				%>
				<%
					if (nowpage == totalpage - 1) {
				%>
				<a class="btn btn-default" href="#">다음</a>
				<%
					} else {
				%>
				<a class="btn btn-primary"
					href="/chap10/freeboard_search.jsp?nowpage=<%=nowpage + 1%>&stype=<%=what%>&sval=<%=val%>">다음</a>
				<%
					}
				%>
				<a class="btn btn-primary"
					href="/chap10/freeboard_search.jsp?nowpage=<%=totalpage - 1%>&stype=<%=what%>&sval=<%=val%>">마지막</a>
			</div>
			<div class="text-center">
				<a class="btn btn-primary" href="/chap10/freeboard_write.html">글쓰기</a>
			</div>
			<div class="text-center">
				<form method="post" name="megsearch" action="freeboard_search.jsp">
					<span class="col-sm-4"> <select class="form-control"
						name="stype">
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
						<input type="text" name="sval" class="form-control"
							placeholder="검색 키워드를 입력하세요!"> <span
							class="input-group-btn">
							<button class="btn btn-secondary" onClick="check()">찾기</button>
						</span>
					</div>
				</form>
			</div>
			<div class="text-center">
				<a class="btn btn-primary" href="/chap10/freeboard_list.jsp">목록으로</a>
			</div>
		</div>
	</div>
</body>
</html>