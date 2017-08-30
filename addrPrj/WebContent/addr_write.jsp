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
</head>

<body>
    <div class="containt col-md-4 col-md-offset-4">
        <div class="page-header">
            <h1>주소록 등록 화면</h1>
            <a href="addr_list.jsp">주소록 목록으로</a>
        </div>
        <div>
            <form class="form-group  text-center" action="writeProcess.jsp" method="post">
                <table class="table">
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="email"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="tel"></td>
                    </tr>
                    <tr>
                        <td>생일</td>
                        <td><input type="date" name="birth"></td>
                    </tr>
                    <tr>
                        <td>회사</td>
                        <td><input type="text" name="comdept"></td>
                    </tr>
                    <tr>
                        <td>메모</td>
                        <td><input type="text" name="memo"></td>
                    </tr>
                    <tr class="text-center">
                        <td colspan="2">
                            <input class="btn btn-default" type="submit" value="저장">
                            <a href="addr_list.jsp" class="btn btn-default">취소</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>