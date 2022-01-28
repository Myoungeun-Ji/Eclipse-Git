<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Look</title>
</head>
<body>
<h1>${mobile}</h1><br>
<h2>${address}</h2>
<form method=get action="/exercise/view"> <!--밑에 name=으로 해줘야. 주소창 보면 알것  -->
	<input type=text name="nickname">
	<input type=submit value="Send">
</form>
</body>
</html>