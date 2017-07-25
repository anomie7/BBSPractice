<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="mysqlEx.MySqlDriver"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password").trim();
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	final String sql = "select *from woori where id = ?";
%>

<%
	try{
		MySqlDriver mysql = new MySqlDriver();
		conn = MySqlDriver.conn;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		System.out.println("쿼리 실행");
	}catch(SQLException e){
		out.println(e.getMessage());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
function myfunction(){
	if(confirm("삭제하시겠습니까?") == true){
		location.href="delete.jsp?id=<%= id %>";
	}else{
		location.href="#";
	}
}
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">데이터베이스 학습</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.html">Home</a></li>
				<li><a href="create.jsp">테이블 만들기</a></li>
				<li><a href="alter.jsp">테이블 수정하기</a></li>
				<li><a href="insert.html">회원 추가하기</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 조회하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="selectAll.jsp">전체 회원 조회</a></li>
						<li><a href="select.html">개별 회원 조회</a></li>
					</ul>
				</li>
			</ul>
		</div>
    </nav>
    <%
    if(!(rs.next()) ){
    %>
    	<h1>조회되는 회원이 없습니다.</h1>
    <% 
    }else if(password.equals(rs.getString("password"))){
    	%>
    <div class="container">
        <div class="jumbotron">
            <h2><span style="color:blue;"><%=id %>님</span>의 회원 정보입니다. 정보 변경을 원하시면 '수정하기' 버튼을 눌러주세요.</h2>
            <form action="update.jsp" method="post" name="form1" onsubmit="return check()">
                <input type="hidden" name="id" value="<%=id%>">
                <div class="form-group">
                    <label for="input1" class="control-label">이름:</label>
                    <input type="text" name="name"id="input1" class="form-control" 
                    value="<%=rs.getString("name")%>">
                </div>
                <div class="form-group">
                    <label for="input2" class="control-label">E-mail</label>
                    <input type="text" name="email" id="input2" class="form-control"
                    value="<%=rs.getString("email")%>">
                </div>
                <button class="btn btn-primary" name="change" type="submit" >수정하기</button>
                <a onclick="myfunction()" >삭제하기</a>
            </form>
        </div>
        <A class="btn btn-primary" href="main.html">main 으로</A>
   		<A class="btn btn-primary" href="selectAll.jsp">조회페이지로</A>
    </div>
    <%
      }
    %>
</body>
</html>