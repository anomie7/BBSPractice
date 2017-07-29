<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            document.login.submit();
        }
    </script>
</head>
<body>
	
    <hr>
    <div class="container col-md-3 col-md-offset-4">
        <div class="jumbotron">
	<%
	Object mem_name = session.getAttribute("member_name");
	Object mem_id = session.getAttribute("member_id");
	if(mem_id == null){
	%>
            <form name="login" method="post" action="login_process.jsp">
                <div class="form-group">
                    <label for="input1">회원ID</label>
                    <input type="text" class="form-control" id="input1" name="userid">
                </div>
                <div class="form-group">
                    <label for="input2">Pass</label>
                    <input type="password" class="form-control" id="input2" name="password">
                </div>
                <div class="form-group text-center">
                    <a href="javascript:login_check()" class="btn btn-default">로그인</a>
                    <a href="insert.html" class="btn btn-default">회원가입</a>
                </div>
            </form>
            <!--else  -->
            <%}else{ %>
            <ul class="list-group">
                <li class="list-group-item"><%=mem_id %>님 환영합니다.</li>
                <li class="list-group-item"><a href="logout.jsp">로그아웃</a></li>
                <li class="list-group-item"><a href="select.jsp">개인 정보 조회</a></li>
                <li class="list-group-item"><a href="admin.jsp">전체 회원 목록 조회</a></li>
            </ul>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>