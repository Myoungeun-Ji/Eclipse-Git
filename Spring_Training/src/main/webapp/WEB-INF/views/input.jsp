<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>
<%-- <c:if test="${result ne ''}"> <!-- ne 대신 !=써도 됨 --> --%>
<%-- <h1>input RESULT: ${result}</h1> --%>
<%-- </c:if> --%>
<%-- <c:if test="${result eq ''}"> --%>
<!-- <h1>&nbsp;</h1> -->
<%-- </c:if> --%>

<!-- <form method=get action="/exercise/calc">method안써도 get방식 자동적용 -->
<!-- 	x1: <input type=text name="x1"><br> -->
<!-- 	x2: <input type=text name="x2"><br> -->
<!-- 		<input type=submit value="send"> -->
<!-- </form> -->
<form action="/exercise/calc">
x1 : <input type=text name="x1"><br>
x2 : <input type=text name="x2"><br>
연산 : <input type=text name="op"><br>
<input type=submit value="send">
</form>
</body>
</html>