<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <style> -->
<!--/* table {border-collapse:collapse;} */-->
<!--  /* td {border:1px solid green;} */-->
<!-- </style> -->
<!-- <body> -->
<!-- <form method=post action="/edu/login1" id=frmscheck> -->


<!-- <table align=center valign=middle> -->
<%-- <tr><td align=center>실명</td><td><input type=text name=name size=12 value="${realname}"></td></tr> --%>
<!-- <tr><td align=center>성별</td><td> -->
<%-- 	<input type=radio name=gender id=male value="${male}">남성 --%>
<%-- 	<input type=radio name=gender id=female value="${female}">여성</td> --%>
<!-- </tr> -->
<%-- <tr><td align=center>아이디</td><td colspan=3><input type=text name=userid id=userid value="${userid}"></td></tr> --%>
<%-- <tr><td align=center>비밀번호</td><td><input type=password name=passcode id=passcode value="${passcode}"></td></tr> --%>
<%-- <tr><td align=center>비밀번호확인</td><td><input type=password name=passcode1 id=passcode1 value="${passcode1}"></td></tr> --%>
<!-- <tr><td align=center>관심분야</td> -->
<!-- 	<td colspan=3> -->
<%-- 		<input type=checkbox name=interest value="${politics}">정치 --%>
<%-- 		<input type=checkbox name=interest value="${ecnomics}">경제 --%>
<%-- 		<input type=checkbox name=interest value="${social}">사회<br> --%>
<%-- 		<input type=checkbox name=interest value="${culture}">문화 --%>
<%-- 		<input type=checkbox name=interest value="${arts}">예술 --%>
<%-- 		<input type=checkbox name=interest value="${entertainments}">연예<br> --%>
<%-- 		<input type=checkbox name=interest value="${history}">역사 --%>
<%-- 		<input type=checkbox name=interest value="${sports}">스포츠 --%>
<%-- 		<input type=checkbox name=interest value="${etc}">기타 --%>
<!-- 	</td></tr> -->
<!-- <tr><td colspan=4 align=center> -->
<!-- 	<input type=submit value='가입완료'>&nbsp; -->
<!-- 	<input type=reset value='비우기'>&nbsp; -->
<!-- 	<input type=button value='취소' id=btnCancel> -->
<!-- </td></tr> -->
<!-- </table> -->
<!-- </form> -->
<!-- </body> -->
<!-- <script src='https://code.jquery.com/jquery-3.5.0.js'></script> -->
<!-- <script> -->
<!-- // $(document) -->
<!-- // .on('click','#btnCancel',function(){ -->
<!-- // 	document.location='home.jsp'; //stop bubbling effect -->
<!-- // 	return false; -->
<!-- // }) -->
<!-- // .on('submit','#frmSignon',function(){ -->
<!-- // 	if($('input[name=name]').val()==''){ -->
<!-- // 		alert('실명을 입력하십시오.'); return false; -->
<!-- // 	} -->
<!-- // 	if($('input[name=gender]:checked').val()==undefined){ -->
<!-- // 		alert('성별을 지정하십시오.'); return false; -->
<!-- // 	} -->
<!-- // 	if($('input[name=userid]').val()==''){ -->
<!-- // 		alert('아이디를 입력하십시오.'); return false; -->
<!-- // 	} -->
<!-- // 	if($('input[name=passcode]').val()!=$('input[name=passcode1]').val()){ -->
<!-- // 		alert('비밀번호와 확인란은 일치해야 합니다.'); return false; -->
<!-- // 	} -->
<!-- // 	if($('input[name=passcode]').val()==''){ -->
<!-- // 		alert('비밀번호를 입력하십시오.'); return false; -->
<!-- // 	} -->
<!-- // 	let str=''; -->
<!-- // 	$('input[name=interest]:checked').each(function(){ -->
<!-- // 		str+=','+$(this).val(); -->
<!-- // 	}) -->
<!-- // 	if(str==''){ -->
<!-- // 		alert('관심분야는 하나이상 선택하십시오'); return false; -->
<!-- // 	} -->
<!-- // 	return true; -->
<!-- // }) -->
<!-- </script> -->
<!-- </html> -->





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
table {
border:1px solid blue;
border-collapse:collapse;}
td { border:1px solid blue;}
</style>
</head>

<body>
<form method="GET" action="/edu/signon_check" id=frmSignon>
<table>
<tr><td align=right>실명:</td><td><input type=text name=name></td>
    <td align=right>성별:</td><td><input type=radio name=gender value=남성>남성&nbsp;
            <input type=radio name=gender value=여성>여성</td>
</tr>
<tr><td align=right>아이디:</td><td><input type=text name=id></td></tr>
<tr><td align=right>비밀번호:</td><td><input type=text name=passcode1></td>
    <td align=right>비밀번호 확인:</td><td><input type=text name=passcode2></td></tr>
<tr><td valign=top>관심분야:</td>
       <td colspan=3>
       <input type=checkbox value=정치 name=Interests>정치&nbsp;
        <input type=checkbox value=경제 name=Interests>경제&nbsp;
        <input type=checkbox value=사회 name=Interests>사회&nbsp;
        <input type=checkbox value=문화 name=Interests>문화<br>
        <input type=checkbox value=역사 name=Interests>역사&nbsp;
        <input type=checkbox value=연예 name=Interests>연예&nbsp;
        <input type=checkbox value=스포츠 name=Interests>스포츠&nbsp;
        <input type=checkbox value=예술 name=Interests>예술&nbsp;
        </td></tr>
<tr>
   <td colspan=4 align=center>
      <input type=submit value="가입완료">&nbsp;&nbsp;
      <input type=button id=sub value='취소' onclick='document.location/edu/home'>
   </td>
</tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>


</html>