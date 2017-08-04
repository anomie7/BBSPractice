<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">	
<c:if test="${null eq sessionScope.userid}">
<script>
	alert("로그인해주세요.");
	location.href = "index.jsp";
</script>
</c:if>
    <script>
        var form = document.modify;
        var pwdNotEqual;

        function checkpwd() {
            if (join.newpassword.value != join.newpassword2.value) {
                document.getElementById("p1").innerHTML = "입력한 비밀번호가 다릅니다."
                document.getElementById("p1").style.color = "red";
                pwdNotEqual = false;
            } else {
                document.getElementById("p1").innerHTML = "입력한 비밀번호가 같습니다."
                document.getElementById("p1").style.color = "blue";
                pwdNotEqual = true;
            }
        }

        function checkForm() {
            if (join.userid.value == "" || join.newpassword.value == "" || join.newpassword2.value == "" ||
            		join.username == "" || join.securitynum.value == "" || join.email.value == "" ||
            		join.zipcode.value == "" || join.address.value == "" || join.phone.value == "") {
                alert("입력되지 않은 항목이 있습니다.")
                return false;
            } else if (!pwdNotEqual) {
                alert("비밀번호를 확인해주세요.")
                return false;
            }else if(join.newpassword.value == ${user.password}){
            	alert("새로 입력한 비밀번호가 이전 비밀번호와 같습니다.");
            	return false;
            }else
                return true;
        }
        
        function zipcodeSearch(){
      	  window.open( "zipcode_search.jsp", "win", "width= 400px, height = 600px" );
        }
    </script>
</head>
<body>
    <article class="container">
        <div class="page-header">
            <h1>회원 정보 수정</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
            <form role="form" name="join" method="post" action="/Update" onsubmit='return checkForm()'>
                <div class="form-group">
                    <label for="Inputid">아이디</label>
                    <input type="text" class="form-control" name="userid" id="Inputid" readonly="readonly" value="${user.userid}">
                </div>
                <div class="form-group">
                    <label for="InputPassword1">비밀번호</label>
                    <input type="password" class="form-control" id="InputPassword1" name="newpassword" placeholder="비밀번호" onblur="checkpwd()">
                </div>
                <div class="form-group">
                    <label for="InputPassword2">비밀번호 확인</label>
                    <input type="password" class="form-control" name="newpassword2" id="InputPassword2" onblur="checkpwd()" placeholder="비밀번호 확인">
                    <p id="p1" class="help-block">(영문+숫자 4~12자리)</p>
                </div>
                <div class="form-group">
                    <label for="username">이름</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력해 주세요" value="${user.username}">
                </div>
                <div class="form-group">
                    <label for="securitynum">주민등록번호</label>
                    <input type="text" class="form-control disable" name="securitynum" id="securitynum" value="수정불가" disabled >
                </div>
                <div class="form-group">
                    <label for="InputEmail">이메일 주소</label>
                    <input type="email" class="form-control" name="email" id="InputEmail" placeholder="이메일 주소" value="${user.email}">
                </div>
                <div class="form-group">
                    <label for="Inputzipcode">우편번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="zipcode" id="Inputzipcode" placeholder="-없이 입력해주세요." value="${user.zipcode }">
                        <span class="input-group-btn">
                  <button class="btn btn-success" type="button" onclick="zipcodeSearch()">우편번호 검색<i class="fa fa-mail-forward spaceLeft"></i></button>
            </span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Inputadress">주소</label>
                    <input type="text" class="form-control" name="address" id="Inputadress" placeholder="주소를 입력해주세요." value="${user.address}">
                </div>
                <div class="form-group">
                    <label for="inputphone">휴대폰</label>
                    <input type="tel" class="form-control" name="phone" id="inputphone" placeholder="- 없이 입력해 주세요" value="${user.phone}">
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-info">수정<i class="fa fa-check spaceLeft" ></i></button>
                    <button type="button" class="btn btn-warning" onclick="javascript:history.go(-1)">취소<i class="fa fa-times spaceLeft"></i></button>
                </div>
            </form>
        </div>
    </article>
</body>
</html>
