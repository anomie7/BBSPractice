<%@page import="com.chap10.util.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	session = request.getSession();
	String[] a = session.getValueNames();
	
	String cardno = "";
	String wname = request.getParameter("wname");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	String pay = request.getParameter("pay");
	
	if(pay.equals("card"))
		cardno = request.getParameter("number");
	
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	int count = Integer.parseInt(request.getParameter("count"));
	long id = 0;
	int num = 0;
	int qty = 0;
	String pname = "";
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd = myformat.format(yymmdd);
	
	
	final String selectMaxId = "select max(id) from saleorder";
	final String insertOrder = "insert into saleorder(id, name, orderdate, addr, tel, pay, cardno, prodcount, total)"
								+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	final String selectProd = "select pname, downprice from product where id = ?";
	final String insertItem = "insert into item(orderid, mynum, prodid, pname, quantity, price)"
							   + " values(?, ?, ?, ?, ?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	int cnt2 = 0;
	int price = 0;
	
	try{
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(selectMaxId);
		rs = pstmt.executeQuery();
		
		if(rs.next())
			id = rs.getLong(1) + 1;
		else 
			id = 1;
		rs.close();
		pstmt.close();
		
		pstmt = conn.prepareStatement(insertOrder);
		pstmt.setLong(1, id);
		pstmt.setString(2, wname);
		pstmt.setString(3, ymd);
		pstmt.setString(4, addr);
		pstmt.setString(5, tel);
		pstmt.setString(6, pay);
		pstmt.setString(7, cardno);
		pstmt.setInt(8, count);
		pstmt.setInt(9, totalPrice);
		cnt = pstmt.executeUpdate();
		pstmt.close();
		if(cnt > 0){
			for(int i = 0; i < a.length; i++){
				long pid = Long.parseLong(a[i].trim());
				qty = ((Integer)session.getValue(a[i])).intValue();
				num = i+1;
				pstmt = conn.prepareStatement(selectProd);
				pstmt.setLong(1, pid);
				rs = pstmt.executeQuery();
				rs.next();
				pname = rs.getString("pname");
				price = rs.getInt("downprice");
				rs.close();
				pstmt.close();
				
				pstmt = conn.prepareStatement(insertItem);
				pstmt.setLong(1, id);
				pstmt.setInt(2, num);
				pstmt.setLong(3, pid);
				pstmt.setString(4, pname);
				pstmt.setInt(5, qty);
				pstmt.setInt(6, price);
				cnt2 += pstmt.executeUpdate();
			}
			
			if(cnt2 == count){
				System.out.println("주문이 정상적으로 처리되었습니다.");
				session.invalidate();
				response.sendRedirect("order_list.jsp?id=" + id);
			}else{
				System.out.println("주문이 정상적으로 처리되지 못했어요.");
				response.sendRedirect("sale_list.jsp");
			}
		}
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		JDBCUtil.close(rs, pstmt, conn);
	}
	
%>