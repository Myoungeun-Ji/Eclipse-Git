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
<form method="POST" action="/exam/DoSignon" id=frmSignon>
<table>
<tr><td align=right>실명:</td><td><input type=text name=name id=name></td>
    <td align=right>성별:</td><td><input type=radio name=gender id=gender value=남성>남성&nbsp;
            <input type=radio name=gender id=gender value=여성>여성</td>
</tr>
<tr><td align=right>아이디:</td><td><input type=text name=userid id=userid></td>
<td><input type=button value=중복체크 name=btncheck></td></tr>
<tr><td align=right>비밀번호:</td><td><input type=password name=passcode id=passcode></td>
    <td align=right>비밀번호 확인:</td><td><input type=password name=passcode1 id=passcode1></td></tr>
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
      <input type=submit value="가입완료" name="Login">&nbsp;&nbsp;
      <input type=button value='취소' id=btnCancel >
   </td>
</tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
 $(document) 
 .on('click','#btncheck',function(){
	 
	 $.post("/exam/checkid",{userid :$('#userid').val()},function(txt){
		 if()
	})
 })
 .on('click','#btnCancel',function(){ 
 	document.location='/exam/'; //stop bubbling effect 
 	return false; 
 }) 
 .on('submit','#frmSignon',function(){ 
 	if($('input[name=name]').val()==''){ 
 		alert('실명을 입력하십시오.'); return false; 
 	} 
 	if($('input[name=gender]:checked').val()==undefined){ 
 		alert('성별을 지정하십시오.'); return false; 
 	} 
 	if($('input[name=userid]').val()==''){ 
 		alert('아이디를 입력하십시오.'); return false; 
 	} 
 	if($('input[name=passcode]').val()!=$('input[name=passcode1]').val()){ 
 		alert('비밀번호와 확인란은 일치해야 합니다.'); return false; 
 	} 
 	if($('input[name=passcode]').val()==''){ 
 		alert('비밀번호를 입력하십시오.'); return false; 
 	} 
 	let str=''; 
 	$('input[name=Interests]:checked').each(function(){ 
 		str+=','+$(this).val(); 
 	}) 
 	if(str==''){ 
 		alert('관심분야는 하나이상 선택하십시오'); 
 		return false; 
 	} 
 	return true; 
 }); 
</script> 

</html>