<%@page import="java.sql.SQLException"%>
<%@page import="com.addrprj.util.JDBCUtill"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ad" class="com.addrprj.dao.StudentDAO" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	ad.deleteAddr(Integer.parseInt(request.getParameter("id")));
	
	response.sendRedirect("addr_list.jsp");
%>