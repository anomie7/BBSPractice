<%@page import="com.addrprj.*"%>
<%@page import="java.util.*"%>
<%@page import="com.addrprj.domain.AddrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sd" class="com.addrprj.dao.StudentDAO"></jsp:useBean>
 <% 
 	List<AddrVO> list = sd.getList();
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
    <div class="contatiner col-md-4 col-md-offset-4">
        <div class="page-header">
            <h1>주소록 전체 조회 화면</h1>
            <a href="addr_write.jsp">주소록 등록</a>
        </div>
        <table class="table table-striped">
            <tr>
                <td>번호</td>
                <td>이름</td>
                <td>전화번호</td>
                <td>생일</td>
                <td>회사</td>
                <td>메모</td>
            </tr>
            <%for(AddrVO addr : list){ %>
            <tr>
                <td><a href="addr_update.jsp?id=<%=addr.getId()%>"><%=addr.getId()%></a></td>
                <td><%=addr.getName() %></td>
                <td><%=addr.getTel() %></td>
                <td><%=addr.getBirth() %></td>
                <td><%=addr.getComdept() %></td>
                <td><%=addr.getMemo() %></td>
            </tr>
            <%} %>
        </table>
    </div>
    </body>
</html>