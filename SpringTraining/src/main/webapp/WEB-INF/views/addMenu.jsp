<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
</head>
<body>
<table>
<tr>
	<td valign=top>
		<select id=selMenu style='width:200px;' size=10>
		<c:forEach items="${alMenu}" var="menu"> 
		<option value=${menu.code}>${menu.name},${menu.price}</option>
		</c:forEach>
		</select>
	</td>
	<td valign=top>
		<form id=frmAddMenu action="/exercise/addMenu1">
			<input type=hidden id=code name=code> <!-- hidden -->
			<table>
			<tr><td align=right>메뉴명:</td>
				<td><input type=text name=menu_name></td>
			</tr>
			<tr><td align=right>가격:</td>
				<td><input type=number name=price></td>
			</tr>
			<tr><td colspan=2 align=center>
				<input type=submit value='추가'>
				<input type=button id=btnDelete name=btnDelete value=삭제>
				<input type=reset value='비우기'>
				</td>
			</tr>
			</table>
		</form>
	</td>
</tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmAddMenu',function(){
	if($('input[name=menu_name]').val()=='' || $('input[name=price]').val()=='') {
		alert('값이 입력되어야 합니다.');
		return false;
	}
	return true;
})
.on('click','#selMenu option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#code').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=menu_name]').val(ar[0]);
	$('input[name=price]').val($.trim(ar[1]));
	return false;
})
.on('click','#btnDelete',function(){
	let url="/exercise/deleteMenu?code="+$('#code').val();
	console.log(url);
	document.location=url;
	return false;	
})
</script>
</html>