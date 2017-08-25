<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session = request.getSession();
	String id = request.getParameter("id");
	int qty = Integer.parseInt(request.getParameter("quantity"));
	
	if(qty == 0)
		session.removeValue(id);
	else
		session.putValue(id, new Integer(qty));
	
	response.sendRedirect("sale_list.jsp");
%>