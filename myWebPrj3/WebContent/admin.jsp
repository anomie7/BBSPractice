<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${null eq userid}">
<script>
	alert("로그인해주세요.");
	location.href = "index.jsp";
</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>관리자 로그인</title>
<script>
	function chkadmin(){
		if(join.admin.value == 'admin'){
			return true;
		}else{
			alert("비밀번호가 틀립니다.");
			location.href = "index.jsp";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container col-md-3 col-md-offset-4">
	<div class="page-header">
		<h1>관리자 로그인</h1>
		<p>전체 회원 조회를 위해 관리자 로그인을 해주세요.</p>
	</div>
	<div class="jumbotron">
		<form name="join" action="/SelectAll" method="post" onsubmit="return chkadmin();">
			<div class="form-group">
				<label for="admin">관리자 비밀번호</label>
				<div class="input-group">
					<input type="password" class="form-control" name="admin" id="admin"
						placeholder="관리자 비밀번호" /> <span class="input-group-btn">
						<button type="submit" class="btn btn-primary">확인</button>
					</span>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>