
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>login</title>
</head>
<body>
<h1>로그인 페이지</h1><hr>
<form method=GET action="/exam/doLogin">
<table>
<tr><td >아이디</td><td><input type=text name=userid id=userid value="${userid}"></td></tr>
<tr><td>비밀번호</td><td><input type=text name=passcode id=passcode value="${passcode}"></td></tr>
<tr><td colspan=2><input type=submit value='로그인'>&nbsp;&nbsp;
              <button type="button" id=btnCancel value='취소'>취소</button>
</td></tr>
</table>

</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCancel',function(){
	document.location='/exam/';
	return false;
})
.on('submit','#frmLogin',function(){
	alert($('#userid').val());
   if($('#userid').val()=='') {
      alert('아이디를 입력하세요.');
      return false;

   }
   if($('#passcode').val()=='') {
	      alert('비밀번호를 입력하세요.');
	      return false;
   }
   return true;
});
</script>
</html>