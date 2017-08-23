<%@page import="com.chap10.domain.ProductVO"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String filepath = "http://localhost:8181/chap12/upload/";
	long id = Long.parseLong(request.getParameter("id"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select *from product where id = ?";
	ProductVO vo = null;
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, id);
		rs = pstmt.executeQuery();
		rs.next();
		vo = new ProductVO(rs.getLong("id"), rs.getString("wname"), rs.getString("pname"),
									rs.getString("sname"), rs.getInt("price"), rs.getInt("downprice"),
									rs.getString("description"), rs.getString("small"), rs.getString("large"));
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
	
	String uri = filepath  +vo.getSmall();
	System.out.println(uri);
%>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
        	function view(temp){
        		filename = "http://localhost:8181/chap12/upload/" + temp;
        		i = window.open(filename, "win", "height=350, width=450, toolbar=0, menubar=0, scrollbars=1, resizable=1, status=0");
        	}
        </script>
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h1>제품 상세 보기</h1>
            </div>
        <div>
        <a href="product_list.jsp">목록으로</a>
        <table item-width="500px">
            <tr>
                <td rowspan="4" item-width="150px">
                    <a href=javascript:view("<%=vo.getLarge()%>"); style="text-align:center"><img width="100px" height="100px" src="<%=uri%>"><br>확대</a>
                </td>
            </tr>
            <tr>
                <td><%=vo.getPname()%>(<%=vo.getId()%>) ---작성자:<%=vo.getWname()%></td>
            </tr>
            <tr>
                <td>상세설명: <%=vo.getDescription()%></td>
            </tr>
            <tr>
                <td></td>
                <td>제조(공급)원:<%=vo.getSname()%> <br>
                   	 시중가: <%=vo.getPrice()%>원
                                      판매가: <%=vo.getDownprice()%>원</td>
            </tr>
        </table>
        </div>
    </div>
    </body>
</html>