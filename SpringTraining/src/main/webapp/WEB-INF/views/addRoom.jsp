<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 관리</title>
</head>
<body>
<table>
<tr>
	<td>
		<select id=selRoom style='width:200px;' size=10>
		<c:forEach items="${alRoom}" var="room"> 
		<option value=${room.roomcode}>${room.name},${room.typename},${room.howmany},${room.howmuch}</option>
		</c:forEach>
		</select>
	</td>
	<td>
		<form id=frmRoom action="/exercise/addRoom1">
			<input type=text id=roomcode name=roomcode>
			<table>
			<tr><td align=right>객실명:</td>
				<td><input type=text name=roomname></td>
			</tr>
			<tr><td align=right>타입:</td>
				<td>
					<select id=roomtype name=roomtype>
					<option value=''>-</option>
           	 		<c:forEach items="${types}" var="types">
      				<option value=${types.typecode}>${types.name}</option>
      				</c:forEach>
            		</select>
					</td>
			</tr>
			<tr><td align=right>숙박가능인원:</td>
				<td><input type=number name=howmany></td>
			</tr>
			<tr><td align=right>숙박비:</td>
				<td><input type=number name=howmuch></td>
			</tr>
			<tr><td colspan=2 align=center>
				<input type=submit value='추가'>
				<input type=button id=btnDelete name=btnDelete value=삭제></td>
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
// .on('click','#selRoom option',function(){
// 	console.log($(this).val()+','+$(this).text());
// 	$('#roomcode').val($(this).val());
// 	let str=$(this).text();
// 	let ar=str.split(',');
// 	$('input[name=roomname]').val(ar[0]);
// 	$('input[name=roomtype]').val($.trim(ar[1]));
// 	$('input[name=howmany]').val($.trim(ar[2]));
// 	$('input[name=howmuch]').val($.trim(ar[3]));
// 	return false;
// })
.on('click','#btnDelete',function(){
	let url="/exercise/deleteRoom?roomcode="+$('#roomcode').val();
	console.log(url);
	document.location=url;
	return false;	
})
.on('click','#selRoom option',function(){
	$('#roomcode').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=roomname]').val($.trim(ar[0]));
	$('input[name=howmany]').val($.trim(ar[2]));
	$('input[name=howmuch]').val($.trim(ar[3]));
	let roomtype=$.trim(ar[1]);
	console.log('roomtype ['+roomtype+']');
	$('#roomtype').val('');
	$('#roomtype option').each(function(){
		if($(this).text()==roomtype) {
			$(this).prop('selected','selected');
			return false;
		}
	});
	return false;
})
</script>
</html>