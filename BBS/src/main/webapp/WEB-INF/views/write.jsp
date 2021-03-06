<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<style>
	td,th{
		border:1px solid blue;
	}
</style>
<body>
<!-- $.ajax(url:'/modify', data:{post_id:$('#post_id').val(),title=$('#title').val(),name=$('#name').val(),content=$('#content').val()}) -->
<form method=post action="/ncs7/write" id=frmWrite>
	<table style="border-collapse:collapse;">
		<tr>
			<td>제목</td>
			<td><input type=text id=title name=title></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type=text id=name name=name></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id=content name=content></textarea></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type=submit id=btnSubmit name=btnSubmit value='작성완료'>
				<input type=reset id=btnReset name=btnReset value='비우기'>
				<input type=button id=btnCancle name=btnCancle value='목록보기'>
			</td>
		</tr>
	</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
	.on('submit','#frmWrite',function(){
		console.log('submit');
		$('#title').val($.trim($('#title').val()));
		$('#name').val($.trim($('#name').val()));
		$('#content').val($.trim($('#content').val()));
		if($('#title').val()=='' || $('#name').val()=='' || $('#content').val()==''){
			alert('비어있는 입력란이 있습니다.');
			return false;
		}
		return true;
	})
	.on('click','#btnCancle',function(){
		document.location="/ncs7/list";
	})
</script>
</html>