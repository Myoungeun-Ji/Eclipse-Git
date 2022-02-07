<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보</title>
</head>
<style>
table {border-collapse:collapse}
th, td {border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>부서아이디</th><th>부서명</th><th>상위부서명</th><th>부서장</th></tr>
</thead>
<tbody>
<c:forEach items="${alDep}" var="dep"> 
<tr>
	<td>${dep.department_id}</td>
	<td>${dep.upperdep}</td>
	<td>${dep.lowerdep}</td>
	<td>${dep.manager_name}</td>
<tr>
</c:forEach>
</tbody>
</table>
</body>
</html>