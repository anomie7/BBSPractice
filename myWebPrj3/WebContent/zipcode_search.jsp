<%@page import="dbconn.MySqlConn"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String searchaddr = request.getParameter("addr");
	String zipcode;
	String sido;
	String gugun;
	String dong;
	String bunji;
	String address;
	final String SQL = "select * from zipcode where dong like ?";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	try{
		MySqlConn msc = new MySqlConn();
		conn = MySqlConn.conn;
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, "%" + searchaddr + "%");
		rs = pstmt.executeQuery();
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
<script>
function choiceZipcode(zipcodeno, address){
	opener.join.zipcode.value = zipcodeno;
	opener.join.address.value = address;
	self.close();
}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <div class="page-header">
            <h1>우편번호 검색</h1>
            <p id="p1" class="help-block">찾고자하는 주소의 동/읍/면 이름을 입력하세요.</p>
            <p>검색한 후 주소를 클릭하세요.</p>
        </div>
        <form name="zipcode" method="post" action="zipcode_search.jsp">
            <div class="form-group">
                <label for="zipcode1"></label>
                <div class="input-group">
                    <input class="form-control" type="text" id="zipcode1" name="addr" placeholder="동/읍/면 입력">
                    <span class="input-group-btn">
                    <button class="btn btn-success">찾기</button>
                </span>
                </div>
            </div>
        </form>
        <div class="container">
        <table class="table table-striped">
            <tr>
                <th>우편번호</th>
                <th>주소</th>
            </tr>
            <%
            	while(rs.next()){
            		zipcode = rs.getString("zipcode");
            		sido = rs.getString("sido");
            		gugun = rs.getString("gugun");
            		dong = rs.getString("dong");
            		bunji = rs.getString("bunji");
            		address = sido + " " + gugun + " " + dong + " " + bunji;
            %>
		            <tr>
		                <td><a href="javascript:choiceZipcode('<%= zipcode %>', '<%= address %>')"><%= zipcode %></a></td>
		                <td><a href="javascript:choiceZipcode('<%= zipcode %>', '<%= address %>')"><%= address %></a></td>
		            </tr>
            <%
            	}
            
            %>
            
        </table>
    </div>
</div>
</body>
</html>