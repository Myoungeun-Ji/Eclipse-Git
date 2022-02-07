<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실타입</title>
</head>
<body>
<form id=frmRType action="/exercise/typeadd">
타입코드 : <input type=number name=typecode><br>
객실타입명: <input type=text name=typename><br>
<input type=submit value='추가'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmRType',function() {
   		if($('input[name=typecode]').val() == '' || 
		   $('input[name=typename]').val() == '' ) {
      alert('모든 값이 입력되어야 합니다!');
      return false;
   }
   return true;
})
</script>
</html>