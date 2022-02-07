<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나라들</title>
</head>
<style>
table {border-collapse:collapse}
th, td {border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>id</th><th>iso_code</th><th>name</th><th>region</th></tr>
</thead>
<tbody>
<c:forEach items="${alCountries}" var="countries"> <!-- items가 model -->
<tr>
	<td>${countries.country_id}</td> <!-- var="변수" -> 변수.db스키마이름 -->
	<td>${countries.country_iso_code}</td>
	<td>${countries.country_name}</td>
	<td>${countries.country_region}</td>
<tr>
</c:forEach>
</tbody>
</table>
</body>
</html>