<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department List</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>department_id</th><th>department_name</th><th>dname</th><th>manager_name</th></tr>
</thead>
<c:forEach items="${aldep}" var="d">
	<tr>
		<td>${d.did}</td>
		<td>${d.dname}</td>
		<td>${d.parent_name}</td>
		<td>${d.manager_name}</td>
		
	</tr>
</c:forEach>
</table>
</body>
</html>