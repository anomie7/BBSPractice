<%@page import="javax.websocket.MessageHandler.Whole"%>
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
<%  List<GuestBoard> list = (List<GuestBoard>) request.getAttribute("list"); 
	int totalpage = (Integer) request.getAttribute("totalpage");
	int now = (Integer) request.getAttribute("now");
	int row = (Integer) request.getAttribute("row");
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
	<div class="container">
		<div class="page-header">
			<h2>조회</h2>
		</div>
		<div class="col-md-6 col-md-offset-3">
		<% 	
			if(now == totalpage-1){
				for(int i = 0; i < list.size() % row; i++){ %>
					 <table class="table table-striped">
            <tr>
                <td>이름</td>
                <td><%= list.get(i).getName() %></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><%= list.get(i).getEmail() %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%= list.get(i).getYmd() %></td>
            </tr>
            <tr>
                <td colspan="2">
                <pre><code><%= list.get(i).getContent() %></code></pre>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
           </table>
			<% }}else
			for(int j = now * row; j < now * row + row; j++ ){
		%>
		 <table class="table table-striped">
            <tr>
                <td>이름</td>
                <td><%= list.get(j).getName() %></td>
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
	<%} %>
		</div>
	</div>
		<div class="text-center">
		<a class="btn btn-primary" href="/Show?now=0">처음</a>
		<a class="btn btn-primary" href="/Show?now=<%=now-1 %>">이전</a>
		<%for(int i = 0; i < totalpage; i++){%>
		<a><%=i+1%></a>
		<%} %>
		<a class="btn btn-primary" href="/Show?now=<%=now+1 %>">다음</a>
		<a class="btn btn-primary" href="/Show?now=<%= totalpage-1 %>">마지막</a>
		</div>
		<div class="text-center">
			<a class="btn btn-primary" href="/chap09/dbgb_write.html">글쓰기</a>
		</div>
</body>
</html>