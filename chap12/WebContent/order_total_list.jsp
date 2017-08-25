<%@page import="com.chap10.domain.OrderVO"%>
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
	final String selectOrder = "select * from saleorder";
	final String selectItem = "select * from item order by mynum";
	
    List<OrderVO> orderList = new ArrayList<>();
    List<ItemVO> itemList = new ArrayList<>();
    
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(selectOrder);
		rs = pstmt.executeQuery();
		while(rs.next()){
			OrderVO vo = new OrderVO();
			vo.setOrderId(rs.getInt("id"));
			vo.setOrderDate(rs.getString("orderdate"));
			vo.setWname(rs.getString("name"));
			vo.setPay(rs.getString("pay"));
			vo.setAddr(rs.getString("addr"));
			vo.setTel(rs.getString("tel"));
			vo.setProdCount( rs.getInt("prodcount"));
			vo.setTotal(rs.getInt("total"));
			orderList.add(vo);
		}
		rs.close();
		pstmt.close();
		
		pstmt = conn.prepareStatement(selectItem);
		rs = pstmt.executeQuery();
		while(rs.next()){
			ItemVO vo = new ItemVO();
			vo.setOrderid(rs.getInt("orderid"));
			vo.setMynum(rs.getInt("mynum"));
			vo.setPname(rs.getString("pname"));
			vo.setPrice(rs.getInt("price"));
			vo.setProdId(rs.getLong("prodid"));
			vo.setQuantity(rs.getInt("quantity"));
			itemList.add(vo);
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
            <%for(int i = 0; i < orderList.size(); i++){ %>
            <table class="table table-striped">
                <tr>
                    <th class="text-center" colspan="5">주문 내역서</th>
                </tr>
                <tr>
                    <th>주문 번호</th>
                    <td colspan="4"><%=orderList.get(i).getOrderId() %></td>
                </tr>
                <tr>
                    <th>주문 날짜</th>
                    <td colspan="4"><%=orderList.get(i).getOrderDate() %></td>
                </tr>
                <tr>
                    <th>고객 이름</th>
                    <td colspan="4"><%=orderList.get(i).getWname() %></td>
                </tr>
                <tr>
                    <th>결제 유형</th>
                    <td colspan="4"><%=orderList.get(i).getPay() %></td>
                </tr>
                <tr>
                    <th>배달 주소</th>
                    <td colspan="4"><%=orderList.get(i).getAddr() %></td>
                </tr>
                <tr>
                    <th>전화 번호</th>
                    <td colspan="4"><%= orderList.get(i).getTel() %></td>
                </tr>
                <tr>
                    <th>상품코드</th>
                    <td>상품 이름</td>
                    <td>주문 수량</td>
                    <td>판매가격</td>
                    <td>합계</td>
                </tr>
                <%
                for(int j = 0; j < itemList.size(); j++){
                  if(orderList.get(i).getOrderId() == itemList.get(j).getOrderid()){ %>
                <tr>
                    <th><%=itemList.get(j).getMynum() + " " + itemList.get(j).getProdId()%></th>
                    <td><%=itemList.get(j).getPname() %></td>
                    <td><%=itemList.get(j).getQuantity()%></td>
                    <td><%=itemList.get(j).getPrice()%></td>
                    <td><%=itemList.get(j).getQuantity() * itemList.get(j).getPrice()%></td>
                </tr>
                <%} } %>
                <tr>
                    <td colspan="5" style="text-align: right">주문상품:<%=orderList.get(i).getProdCount() + "품목    "%>  합계금액:<%=orderList.get(i).getTotal()+ "원" %> </td>
                </tr>    
            </table>
            <%} %>
            <a class="btn btn-default col-md-offset-7" href="main.html">메인으로</a>
        </div>
    </body>
</html>