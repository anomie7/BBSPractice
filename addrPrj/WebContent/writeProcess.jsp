<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ad" class="com.addrprj.dao.StudentDAO" />
<jsp:useBean id="vo" class="com.addrprj.domain.AddrVO" />
<%
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setComdept(request.getParameter("comdept"));
	vo.setBirth(request.getParameter("birth"));
	vo.setTel(request.getParameter("tel"));
	vo.setMemo(request.getParameter("memo"));
	
	boolean isCreate =  ad.createAddr(vo);		 
	
	if(isCreate)
		response.sendRedirect("addr_list.jsp");
%>