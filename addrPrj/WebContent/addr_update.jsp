<%@page import="java.util.*"%>
<%@page import="com.addrprj.domain.AddrVO"%>
<%@page import="com.addrprj.util.JDBCUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sd" class="com.addrprj.dao.StudentDAO"></jsp:useBean>
<%
	AddrVO vo =  sd.getVO(Integer.parseInt(request.getParameter("id")));	
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
    <script>
    function check(){
    	var password = prompt("비밀번호를 입력해주세요.");
    	
    	if(password == 1234){
    		var isDelete = confirm("정말 삭제하시겠어요?");
    		if(isDelete){
	    		location.href = "deleteProcess.jsp?id=<%=vo.getId()%>";
    		}
    	}else{
    		alert("비밀번호가 틀렸어요.")
    	}
    	
    }
    
    function checkpass(){
	var password1 = prompt("비밀번호를 입력해주세요.");
    
    	if(password1 == 1234){
    		location.href = "deleteProcess.jsp?id=<%=vo.getId()%>";
    		return true;
    	}else{
    		alert("비밀번호가 틀렸어요.")
    		return false;
    	}
    	
    }
    </script>
</head>

<body>
    <div class="containt col-md-4 col-md-offset-4">
        <div class="page-header">
            <h1>주소록 등록 화면</h1>
            <a href="addr_list.jsp">주소록 목록으로</a>
        </div>
        <div>
            <form class="form-group  text-center" action="updateProcess.jsp" method="post" onsubmit="return checkpass()">
                <table class="table">
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name" value="<%=vo.getName()%>"></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="email" value="<%=vo.getEmail()%>"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="tel" value="<%=vo.getTel()%>"></td>
                    </tr>
                    <tr>
                        <td>생일</td>
                        <td><input type="text" name="birth" value="<%=vo.getBirth() %>"></td>
                    </tr>
                    <tr>
                        <td>회사</td>
                        <td><input type="text" name="comdept" value="<%=vo.getComdept() %>"></td>
                    </tr>
                    <tr>
                        <td>메모</td>
                        <td><input type="text" name="memo" value="<%=vo.getMemo()%>">
                        	<input type="hidden" name="id" value="<%=vo.getId()%>">
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td colspan="2">
                            <input class="btn btn-default" type="submit" value="수정">
                            <a class="btn btn-default" onclick="check()">삭제</a>
                            <a href="addr_list.jsp" class="btn btn-default">취소</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>