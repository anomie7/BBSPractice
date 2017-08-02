<%@page import="java.sql.SQLException"%>
<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>전체 회원 조회</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
<%
	String userid = (String) session.getAttribute("member_id");
	String username = (String) session.getAttribute("member_name");
	if(userid == null || username == null){
%>		
		
		<script>
		alert("로그인해주세요.");
		location.href = "index.jsp";
		</script>
<%		
	}

%>
<%
	String address = null;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	final String SQL = "select *from member";
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
	}catch(SQLException e){
		out.print(e.getMessage());
	}
%>
</head>
<body>
<div class="container">
	 <div class="page-header">
            <h1>전체 회원 조회</h1>
            <p id="p1" class="help-block">가입한 회원들을 모두 조회합니다.</p>
        </div>
        <table class="table table-striped">
            <tr>
                <th>사용자 ID</th>
                <th>이름</th>
                <th>주소</th>
            </tr>
            <%
            	while(rs.next()){
            		userid = rs.getString("userid");
            		username = rs.getString("username");
            		address = rs.getString("address");
            %>
		            <tr>
		              	<td><%=userid %></td>
		               	<td><%=username %></td>
		               	<td><%=address %></td>
		            </tr>
            <%
            	}
            
            %>
            
        </table>
        	<a class="btn btn-primary text-center" href="index.jsp">Home</a>
        </div>
    </body>