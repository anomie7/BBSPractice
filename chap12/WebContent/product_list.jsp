<%@page import="java.util.ArrayList"%>
<%@page import="com.chap10.domain.ProductVO"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	String cond = "";
	String cond2 = "";
	String ca = "";
	String pn = "";
	if(request.getParameter("cat") != null){
		if(!(request.getParameter("cat").equals(""))){
			ca=request.getParameter("cat");
			cond = " where category =" + ca;
		}
	}
	
	if(request.getParameter("pname") != null){
		if(!(request.getParameter("pname").equals(""))){
			ca=request.getParameter("pname");
			cond2 = " where pname like ?";
		}
	}
	
	final String sql = "select * from product " + cond + cond2 +" order by id";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductVO> list = new ArrayList<ProductVO>();
	try{
		conn = JDBCUtil.getConnection();
		if(cond2.equals(""))
			pstmt = conn.prepareStatement(sql);
		else{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pname"));
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		ProductVO vo = new ProductVO(rs.getLong("id"), rs.getString("category"), rs.getString("pname")
									, rs.getString("sname"), rs.getInt("downprice"), rs.getString("inputdate"), rs.getInt("stock"));
		
		switch(Integer.parseInt(vo.getCategory())){
		case 11:
			vo.setCategory("가구");
			break;
		case 22:
			vo.setCategory("전기/전자");
			break;
		case 33:
			vo.setCategory("부엌용품");
			break;
		case 44:
			vo.setCategory("의류");
			break;
		case 55:
			vo.setCategory("보석 및 악세서리");
			break;
		case 66:
			vo.setCategory("헬스 기구");
			break;
		case 77:
			vo.setCategory("컴퓨터 관련");
			break;
		case 88:
			vo.setCategory("기타");
		default:
				break;
		}
		
		list.add(vo);
		}
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="page-hearder">
			<h1>상품 목록 보기</h1>
		</div>
		<div class="btn-group" style="padding-bottom: 35px;">
			<a class="btn btn-default" href="main.html">메인으로</a> <a
				class="btn btn-default" href="product_list.jsp">전체</a> <a
				class="btn btn-default" href="product_list.jsp?cat=11">가구</a> <a
				class="btn btn-default" href="product_list.jsp?cat=22">전기/전자</a> <a
				class="btn btn-default" href="product_list.jsp?cat=33">부엌용품</a> <a
				class="btn btn-default" href="product_list.jsp?cat=44">의류</a> <a
				class="btn btn-default" href="product_list.jsp?cat=55">보석 및 악세서리</a>
			<a class="btn btn-default" href="product_list.jsp?cat=66">헬스 기구</a> <a
				class="btn btn-default" href="product_list.jsp?cat=77">컴퓨터 관련</a> <a
				class="btn btn-default" href="product_list.jsp?cat=88">기타</a>
		</div>
		 <div>
            <form class="form-group">
                <span class="input-group">
                <label class="input-group-item" for="search">상품으로 찾기</label>
                <input class="input-group-item" type="text" name="pname" id="search">
                <input class="btn input-group-item btn-sm" type="submit" value="검색">
                </span>
            </form>
        </div>
		<div>
			<table class="table table-striped">
				<tr class="text-center">
					<th>번호</th>
					<th>상품명</th>
					<th>코드번호</th>
					<th>제조원</th>
					<th>판매시작일</th>
					<th>판매가(원)</th>
					<th>재고량</th>
					<th>분류</th>
				</tr>
			<%for(int i = 0; i < list.size(); i++){ %>
				<tr>
					<td><%=1 + i%></td>
					<td><a href="product_read.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getPname()%></a></td>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getSname()%></td>
					<td><%=list.get(i).getInputdate()%></td>
					<td><%=list.get(i).getDownprice()%></td>
					<td><%=list.get(i).getStock()%></td>
					<td><%=list.get(i).getCategory()%></td>
				</tr>
				<% } %>
			</table>
		</div>
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">first</a></li>
				<li><a href="#"><<</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">>></a></li>
				<li><a href="#">end</a></li>
			</ul>
		</div>
	</div>
</body>
</html>