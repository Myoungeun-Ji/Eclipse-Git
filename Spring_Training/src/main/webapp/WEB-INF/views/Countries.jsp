<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<thead>
	<tr><th>country_id</th><th>country_iso_code</th><th>country_name</th><th>country_region</th></tr>
</thead>
<c:forEach items="${alctry}" var="ctry">
	<tr>
		<td>${ctry.country_id }</td>
		<td>${ctry.country_iso_code }</td>
		<td>${ctry.country_name }</td>
		<td>${ctry.country_region}</td>
		
	</tr>
</c:forEach>
</table>
</body>
</html>