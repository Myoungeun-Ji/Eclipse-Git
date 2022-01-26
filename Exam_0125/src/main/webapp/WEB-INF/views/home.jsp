<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body align=right>
<c:if test="${id==null}">
<a href='/exam/login'>로그인</a>&nbsp;&nbsp;<a href='/exam/signon'>회원가입</a>
</c:if>
<c:if test="${id!=null}">
${id}&nbsp;,&nbsp;<a href='/exam/logout?userid=${id}'>로그아웃</a>
</c:if>
</body>
</html>