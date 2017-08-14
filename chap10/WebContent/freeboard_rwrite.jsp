<%@page import="dbconn.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	final String SQL = "select * from freeboard where id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	FreeBoard fb = null;
	String cont;
	int pos = 0;
	int step = 0;
	int rnum = 0;
	int mid = 0;
	try {
		MySqlConn sqc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (!rs.next())
			response.sendRedirect("/chap10/freeboard_list.jsp");
		
		fb = new FreeBoard(rs.getString("email"), rs.getString("subject"), rs.getString("name"),
				rs.getString("content"));
		cont = ">" + fb.getContent();
		while((pos = cont.indexOf("\n", pos)) != -1){
			String left = cont.substring(0, pos+1);
			String right = cont.substring(pos+1, cont.length());
			cont = left + ">" + right;
			pos += 2;
		}
		fb.setContent(cont);
		fb.setSubject("Re:" + fb.getSubject());
		step = rs.getInt("step");
		mid = rs.getInt("masterid");
		rnum = rs.getInt("replynum");
	} catch (SQLException e) {
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
<script>
	function check() {
		with (document.msgwrite) {
			if (subject.value.length == 0) {
				alert("제목을 입력해주세요!!");
				subject.focus();
				return false;
			}
			if (name.value.length == 0) {
				alert("이름을 입력해 주세요!!");
				name.focus();
				return false;
			}
			if (password.value != <%=rs.getString("password") %>) {
				alert("패스워드가 틀렸습니다.");
				password.focus();
				return false;
			}
			if (content.value.length == 0) {
				alert("내용을 입력해주세요.");
				content.focus();
				return false;
			}
			document.msgwrite.submit();
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h3>게시판</h3>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<div class="jumbotron">
				<form name="msgwrite" method="post" action="freeboard_rsave.jsp?id=<%=id%>&nowpage=<%=request.getParameter("nowpage") %>">
					<h3>글 답변하기</h3>
					<div class="form-group">
						<label for="input1">이름</label> <input type="text"
							class="form-control" id="input1" name="name" value="<%=fb.getName() %>">
					</div>
					<div class="form-group">
						<label for="input2">E-mail</label> <input type="email"
							class="form-control" id="input2" name="email" value="<%=fb.getEmail() %>">
					</div>
					<div class="form-group">
						<label for="input3">제목</label> <input type="text"
							class="form-control" id="input3" name="subject" value="<%=fb.getSubject() %>">
					</div>
					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea class="form-control" id="textarea1" name="content"
							rows="10" cols="40">

					


					------------------------------------------------------------------------------------<%=fb.getContent()%></textarea>
					</div>
					<div class="form-group">
						<label for="input4">암호</label> <input type="password"
							class="form-control" id="input4" name="password">
					</div>
					<input type="hidden" name="step" value="<%=step%>">
					<input type="hidden" name="mid" value="<%=mid%>">
					<input type="hidden" name="rnum" value="<%=rnum%>">
					<div class="text-center">
						<button class="btn btn-default" type="button"
							onclick="check(this.form)">보내기</button>
						<a class="btn btn-default" href="/chap10/freeboard_list.jsp?nowpage=<%=request.getParameter("nowpage") %>">글
							목록으로</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer class="container-fluid">
		<br>
	</footer>
</body>
</html>