<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body align=right>
<c:if test="${id==null}">
<a href="/edu/login1">로그인</a>



</c:if>
<a href="/edu/signon">회원가입</a>
<c:if test="${id!==null}">
${id}&nbsp;&nbsp;<a href='/edu/logout'>로그아웃</a>
</c:if>



</body>
</html>