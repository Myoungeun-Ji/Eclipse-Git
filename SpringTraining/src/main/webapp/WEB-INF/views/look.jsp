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
<h2>${address }</h2>
<form method="GET" action="/exercise/view"> <!-- http://localhost:8088/exercise/view?nickname=xxx -->
	<input type=text name="nickname">
	<input type=submit value="Send">
</form>
</body>
<script>
document.location="http://localhost:8088/exercise/view?nickname=xxx";
</script>
</html>