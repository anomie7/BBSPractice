<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>인덱스</title>
<script>
	function login_check() {

		if (!document.login.userid.value) {
			alert("ID를 입력하세요!");
			document.login.userid.focus();
			return;
		}

		if (!document.login.password.value) {
			alert("passwword를 입력하세요!");
			document.login.password.focus();
			return;
		}
		loadDoc();
	}
	
	function loadDoc() {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		      if(this.responseText.trim() == "로그인 성공"){
		    	  location.reload(true);
		      }else if(this.responseText.trim() == "비밀번호"){
		    	  alert("비밀번호가 틀립니다.");
		    	  document.login.password.value = "";
		      }else{
		    	  alert(this.responseText);
		    	  location.reload(true);
		      }
		    }
		  };
		  xhttp.open("post", "/login", true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send("userid=" + document.login.userid.value + "&password=" + document.login.password.value);
		}
</script>
</head>
<body>
	<hr>
	<div class="container col-md-3 col-md-offset-4">
		<div class="jumbotron">
			<c:choose>
				<c:when test="${null eq userid }">
					<form name="login" method="post" action="/login">
						<div class="form-group">
							<label for="input1">회원ID</label> <input type="text"
								class="form-control" id="input1" name="userid">
						</div>
						<div class="form-group">
							<label for="input2">Pass</label> <input type="password"
								class="form-control" id="input2" name="password">
						</div>
						<div class="form-group text-center">
							<a href="javascript:login_check()" class="btn btn-default">로그인</a>
							<a href="insert.html" class="btn btn-default">회원가입</a>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<ul class="list-group">
						<li class="list-group-item">${sessionScope.userid}님환영합니다.</li>
						<li class="list-group-item"><a href="/logout">로그아웃</a></li>
						<li class="list-group-item"><a href="/Select">개인 정보 조회</a></li>
						<li class="list-group-item"><a href="admin.jsp">전체 회원 목록 조회</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>