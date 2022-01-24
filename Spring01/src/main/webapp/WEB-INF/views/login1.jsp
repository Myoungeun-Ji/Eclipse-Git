<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {border-collapse:collapse;}
td {border:1px solid green;}
</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<form method=post action="/edu/logout" id=frmlcheck>
<table align=center valign=middle>
<tr><td>아이디</td><td><input type=text id=userid name=userid value="${userid}"></td></tr>
<tr><td>비밀번호</td><td><input type=password id=passcode name=passcode value="${passcode}"></td></tr>
<tr><td align=center colspan=2>
	<input type=submit value='로그인'>&nbsp;
	<input type=reset value='비우기'>&nbsp;
	<input type=button value='취소' id=btnCancel></td></tr>
</table>
</form>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCancel',function(){
	document.location='home.jsp';
	return false;
})
.on('submit','#frmLogin',function(){
	if($('#userid').val()==''){
		alert('userid is empty.');
		return false; //form tag 중단 ->현재화면(login.jsp)에서 중지.
	} 
	if($('#passcode').val()==''){
		alert('passcode is not given.');
		return false;  // form tag 중단 -> 현재화면 (login.jsp)에서 중지
	}
	return true; // form tag 진행 -> 서버로 데이터 전달 & login_check.jsp 실행
})
</script>
</html>