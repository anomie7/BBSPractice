<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.MySqlConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
	String password =  request.getParameter("newpassword");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");

	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	final String SQL = "update member set username = ?, password = ?, email = ?, zipcode = ?, address = ?, phone = ? where userid = ?";
%>

<%
	try {
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.setString(3, email);
		pstmt.setString(4, zipcode);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, userid);
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
alert("성공적으로 수정되었습니다. 다시 로그인해주세요.");
location.href = "index.jsp";
</script>

