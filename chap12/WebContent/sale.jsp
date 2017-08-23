<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session = request.getSession();
	String id = request.getParameter("id");
	int qty = Integer.parseInt(request.getParameter("quantity"));
	
	String[] a = session.getValueNames();
	
	for(int i = 0; i < a.length; i++){
		if(id.equals(a[i])){
			int old = ((Integer) session.getValue(id)).intValue();
			qty = qty + old;
		}
	}
	
	session.putValue(id, new Integer(qty));
	System.out.println(id + "," +qty);
	
	response.sendRedirect("sale_list.jsp");
%>