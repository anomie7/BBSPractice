<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chap10.domain.ProductVO"%>
<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%	
	final String sql = "select * from product where id = ?" +" order by id";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductVO> list = new ArrayList<ProductVO>();
	long id = 0;
	int qty = 0;
	String[] a = session.getValueNames();
	
	for(int i = 0; i < a.length; i++){
		id = Long.parseLong(a[i].trim());
		qty = ((Integer)session.getValue(a[i])).intValue();
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
		ProductVO vo = new ProductVO(rs.getLong("id"), rs.getString("category"), rs.getString("pname")
									, rs.getString("sname"), rs.getInt("downprice"), rs.getString("inputdate"), rs.getInt("stock"), qty);
		list.add(vo);
		}
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
	}
	
	for(ProductVO product : list){
		System.out.println(product.toString());
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
    <div class="container">
        <div class="page-hearder">
            <h1>쇼핑목록</h1>
        </div>
        <div>
            <table class="table table-striped">
                <tr class="text-center">
                    <th>번호</th>
                    <th>상품명</th>
                    <th>제조원</th>
                    <th>주문수량</th>
                    <th>판매가(원)</th>
                    <th>합계</th>
                </tr>
            <%for(int i = 0; i < list.size(); i++) {%>
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=list.get(i).getPname()%></td>
                    <td><%=list.get(i).getSname()%></td>
                    <td>
                        <form action="">
                            <span class="input-group">
                                <input type="text" name="quantity" id="onum" value="<%=list.get(i).getQuantity()%>">개
                                <input type="submit" value="수정">
                                <input type="submit" value="삭제">
                            </span>
                        </form>
                    </td>
                    <td><%=list.get(i).getDownprice()%></td>
                    <td><%=list.get(i).getDownprice() * list.get(i).getQuantity()%></td>
                </tr>
                <%} %>
            </table>
        </div>
        <div class="btn-group" style="padding-left: 400px;">
                <a class="btn btn-default" href="main.html">메인으로</a>
                <a class="btn btn-default" href="shop_list.jsp">계속 쇼핑하기</a>
            </div>
    </div>
</body>
</html>