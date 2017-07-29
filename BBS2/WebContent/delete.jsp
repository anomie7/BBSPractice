<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("member_id");
	if (userid == null) {
%>

<script>
	alert("로그인해주세요.");
	location.href = "index.jsp"
</script>
<%
	}
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	final String SQL = "delete from member where userid = ?";
%>

<%
	try {
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userid);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		out.print("<h1>" + e.getMessage() + "</h1>");
	}
%>

<%
	session = request.getSession(false);
	session.invalidate();
%>

<script>
alert("성공적으로 삭제되었습니다. 서비스를 이용해 주셔서 감사합니다.");
location.href = "index.jsp";
</script>
    