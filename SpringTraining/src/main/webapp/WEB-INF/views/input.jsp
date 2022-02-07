<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>
<form method="GET" action="/exercise/calc"> <!-- http://localhost:8088/exercise/view?nickname=xxx -->
	<input type=text name="x1">
	<input type=text name="x2">
	<select size=4 multiple name=op id=op>
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="*">*</option>
	<option value="/">/</option>
	</select>
	<input type=submit value="Send">
<c:set var="result" value="${result}" />
<c:if test='${result!=""}' >
result: ${result}
</c:if>
<c:if test='${result==""}'>
&nbsp;
</c:if>
</form>
</body>
</html>