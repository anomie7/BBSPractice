<%@page import="com.chap10.domain.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	final String selectOrder = "select * from saleorder where id = ?";
	final String selectItem = "select * from item where orderid = ? order by mynum";
	int orderId = Integer.parseInt(request.getParameter("id"));
	System.out.println(orderId);
	
	String orderDate = null;
	String wname = null;
	String pay = null;
	String addr = null;
	String tel = null;
	int prodCount =0;
	int total = 0;
	List<ItemVO> list = new ArrayList<>();
    
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(selectOrder);
		pstmt.setInt(1, orderId);
		rs = pstmt.executeQuery();
		rs.next();
		orderDate = rs.getString("orderdate");
		wname = rs.getString("name");
		pay = rs.getString("pay");
		addr = rs.getString("addr");
		tel = rs.getString("tel");
		prodCount = rs.getInt("prodcount");
		total = rs.getInt("total");
		pstmt.close();
		rs.close();
		
		pstmt = conn.prepareStatement(selectItem);
		pstmt.setInt(1, orderId);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			ItemVO vo = new ItemVO();
			vo.setMynum(rs.getInt("mynum"));
			vo.setPname(rs.getString("pname"));
			vo.setPrice(rs.getInt("price"));
			vo.setProdId(rs.getLong("prodid"));
			vo.setQuantity(rs.getInt("quantity"));
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container col-md-4 col-md-offset-4">
            <div style="padding-bottom: 10px">
                <h1>주문 내역</h1>
            </div>
            <table class="table table-striped">
                <tr>
                    <th class="text-center" colspan="5">주문 내역서</th>
                </tr>
                <tr>
                    <th>주문 번호</th>
                    <td colspan="4"><%=orderId %></td>
                </tr>
                <tr>
                    <th>주문 날짜</th>
                    <td colspan="4"><%=orderDate %></td>
                </tr>
                <tr>
                    <th>고객 이름</th>
                    <td colspan="4"><%=wname %></td>
                </tr>
                <tr>
                    <th>결제 유형</th>
                    <td colspan="4"><%=pay %></td>
                </tr>
                <tr>
                    <th>배달 주소</th>
                    <td colspan="4"><%=addr %></td>
                </tr>
                <tr>
                    <th>전화 번호</th>
                    <td colspan="4"><%= tel %></td>
                </tr>
                <tr>
                    <th>상품코드</th>
                    <td>상품 이름</td>
                    <td>주문 수량</td>
                    <td>판매가격</td>
                    <td>합계</td>
                </tr>
                <%for(int i = 0; i < list.size(); i++){ %>
                <tr>
                    <th><%=list.get(i).getMynum() + " " + list.get(i).getProdId()%></th>
                    <td><%=list.get(i).getPname() %></td>
                    <td><%=list.get(i).getQuantity()%></td>
                    <td><%=list.get(i).getPrice()%></td>
                    <td><%=list.get(i).getQuantity() * list.get(i).getPrice()%></td>
                </tr>
                <%} %>
                <tr>
                    <td colspan="5" style="text-align: right">주문상품:<%=prodCount + "품목    "%>  합계금액:<%=total + "원" %> </td>
                </tr>    
            </table>
            <a class="btn btn-default col-md-offset-7" href="main.html">메인으로</a>
        </div>
    </body>
</html>