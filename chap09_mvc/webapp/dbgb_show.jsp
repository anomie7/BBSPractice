<%@page import="chap09_model.GuestBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="chap09_model.GuestBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%  List<GuestBoard> list = (List<GuestBoard>) request.getAttribute("list"); %>
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
	<div class="container">
		<div class="page-header">
			<h2>조회</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
		<% 
			for(GuestBoard g : list){
		%>
		 <table class="table table-striped">
            <tr>
                <td>이름</td>
                <td><%=g.getName() %></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><%= g.getEmail() %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%= g.getYmd() %></td>
            </tr>
            <tr>
                <td colspan="2">
                <pre><code><%= g.getContent() %></code></pre>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
           </table>
	<%} %>
		</div>
	</div>
		<div class="text-center">
			<a class="btn btn-primary" href="/chap09/dbgb_write.html">글쓰기</a>
		</div>
</body>

</html>