<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="com.chap10.domain.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String filepath = "http://localhost:8181/chap12/upload/";
	String cond = "";
	String cond2 = "";
	String ca = "";
	String pn = "";
	
	if (request.getParameter("cat") != null) {
		if (!(request.getParameter("cat").equals(""))) {
			ca = request.getParameter("cat");
			cond = " where category =" + ca;
		}
	}

	if (request.getParameter("pname") != null) {
		if (!(request.getParameter("pname").equals(""))) {
			ca = request.getParameter("pname");
			cond2 = " where pname like ?";
		}
	}

	final String sql = "select * from product " + cond + cond2 + " order by id";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductVO> list = new ArrayList<ProductVO>();
	try {
		conn = JDBCUtil.getConnection();
		if (cond2.equals(""))
			pstmt = conn.prepareStatement(sql);
		else {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pname"));
		}
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProductVO vo = new ProductVO(rs.getLong("id"), rs.getString("wname"), rs.getString("pname"),
					rs.getString("sname"), rs.getInt("price"), rs.getInt("downprice"),
					rs.getString("description"), rs.getString("small"), rs.getString("large"));
			list.add(vo);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} finally {
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
	<script>
      function view(temp){
        filename = "http://localhost:8181/chap12/upload/" + temp;
        i = window.open(filename, "win", "height=350, width=450, toolbar=0, menubar=0, scrollbars=1, resizable=1, status=0");
         }
    </script>
</head>
<body>
	<div class="container">
		<div class="page-hearder">
			<h1>쇼핑 목록 보기</h1>
		</div>
		<div class="btn-group" style="padding-bottom: 50px;">
			<a class="btn btn-default" href="main.html">메인으로</a> <a
				class="btn btn-default" href="shop_list.jsp">전체</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=11">가구</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=22">전기/전자</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=33">부엌용품</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=44">의류</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=55">보석 및 악세서리</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=66">헬스 기구</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=77">컴퓨터 관련</a> <a
				class="btn btn-default" href="shop_list.jsp?cat=88">기타</a>
		</div>
		<div>
			<form class="form-group">
				<span class="input-group"> <label class="input-group-item"
					for="search">상품으로 찾기</label> <input class="input-group-item"
					type="text" name="pname" id="search"> <input
					class="btn input-group-item btn-sm" type="submit" value="검색">
				</span>
			</form>
		</div>
		<div>
			<!--for -->
			<table item-width="900px">
			<%for(ProductVO product : list){ %>
				<tr>
					<td rowspan="5" item-width="200px"><a href=javascript:view("<%=product.getLarge()%>");
						style="text-align: center"><img width="100px" height="100px"
							src="<%=filepath + product.getSmall()%>"><br>확대</a>
					</td>
				</tr>
				<tr>
					<td><%=product.getPname()%>(<%=product.getId()%>)</td>
				</tr>
				<tr>
					<td><%=product.getDescription()%></td>
				</tr>
				<tr>
					<td>시중가: <%=product.getPrice()%>원 판매가: <%=product.getDownprice()%>원</td>
				</tr>
				<tr>
						<td>
					<form action="sale.jsp" name="search" method="get">
						<span class="col-sm-offset-5">
                        <label for="onum">주문수량</label>
                        <input  type="text" name="quantity" id="onum">개
                        <input type="hidden" name="id" value="<%=product.getId()%>"/>
                        <input type="submit" value="바구니에 담기">
                        </span>
					</form>
						</td>
				</tr>
			<%} %>
			</table>
			<!--for end -->
		</div>
	</div>
</body>
</html>