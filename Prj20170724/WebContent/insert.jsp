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
<title>Insert title here</title>
</head>
<body>

	<%
	String id =  request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	int cnt = 0;
	
	System.out.println(id + password + name + email);
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	final String select = "select * from woori where id = ?";
	final String sql = "insert into woori(id, password, name, email)" + 
						"values (?, ?, ?, ?)";
	%>

	<%	
		MySqlDriver myDriver = new MySqlDriver();
		conn = MySqlDriver.conn;
		try {
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(!(rs.next() ) ){
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, password);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				cnt = pstmt.executeUpdate();
				
				System.out.println(cnt);
				
				if(cnt > 0){
					out.println("데이터가 성공적으로 입력되었습니다." + "<BR>");
				}else{
					out.println("데이터가 입력되지 않았습니다." + "<BR>");
				}
			}else{
				out.println("id가 이미 등록되어 있습니다." + "<BR>");
			}
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
   %>
   <A class="btn btn-primary" href="main.html">main 으로</A>
   <A class="btn btn-primary" href="insert.html">회원 등록 페이지로</A>
</body>
</html>