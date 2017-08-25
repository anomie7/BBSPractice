<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	function check(f){
    		blank = false;
    		for(i = 0; i < f.elements.lenth; i++){
    			if(f.elements[i].value == ""){
    				if(f.elements[i].name != "number")
    					blank =true;
    				if((f.elements[i].name == "number") && (f.pay.value == "card"))
    					blank = true;
    			}
    		}
    		if(blank == true)
    			alert("모든 항목을 입력하셔야 합니다.")
    		else
    			f.submit();
    	}
    </script>
</head>
<body>
    <div class="container col-md-5 col-md-offset-3">
        <div class="page-hearder" style="padding-bottom: 20px">
            <h1>주문서</h1>
        </div>
        <form action="order_save.jsp" method="post">
        <table class="table">
            <tr>
                <td colspan="2" class="text-center"><b>주문서 작성하기</b></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="wname" id=""></td>
            </tr>
            <tr>
                <th>결제 유형</th>
                <td>
                    <input type="radio" name="pay" value="card" >
                    <label for="card">카드</label>
                    <input type="radio" name="pay" value="cash" >
                    <label for="cash">온라인 입금</label>
                </td>
            </tr>
            <tr>
                <th>카드 번호</th>
                <td><input type="text" name="number" id=""></td>
            </tr>
            <tr>
                <th>배달 주소</th>
                <td><input type="text" name="addr" id=""></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="tel" id=""></td>
            </tr>
            <tr>
                <th>주문 총 금액</th>
                <td><%=request.getParameter("totalPrice")%>원
                	<input type="hidden" name="totalPrice" value="<%=request.getParameter("totalPrice")%>">
                	<input type="hidden" name="count" value="<%=request.getParameter("count")%>">
                </td>
            </tr>
        </table>
        <div class="btn-group col-md-offset-7">
            <input class="btn btn-default" type="button" onclick="check(this.form)" value="확인">
            <input class="btn btn-default" type="reset">
            <a class="btn btn-default" href="sale_list.jsp">돌아가기</a>
        </div>
        </form>
    </div>
</body>
</html>