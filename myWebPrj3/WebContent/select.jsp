<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>개인 정보 조회</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<c:if test="${null eq sessionScope.userid} ">
<script>
	alert("로그인해주세요.");
	location.href = "index.jsp";
</script>
</c:if>
<script>
	function deletechk() {
		if (confirm("정말 삭제하시겠습니까??") == true) {
			location.href = "/Delete"
		} else { //취소
			return;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>개인 정보 조회</h1>
			<p>가입을 축하드립니다. 입력하신 내용을 확인하세요.</p>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<table class="table table-striped">
				<tr>
					<th>아이디</th>
					<td>${user.userid}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${user.username}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>보안상 기재하지 않습니다.</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>${user.email}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${user.zipcode}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${user.address}</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>${user.phone }</td>
				</tr>
				<tr class="col-md-9 col-md-offset-5">
					<td class="btn-group"><a href="index.jsp"
						class="btn btn-success">확인</a> <a
						href="/Modify"
						class="btn btn-info">수정</a> 
					<a class="btn btn-danger" onclick="deletechk()">회원탈퇴</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>