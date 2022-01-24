<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- <html> -->
<!-- <head> -->
<!--    <title>Home</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h1> -->
<!--    Hello world!  changed -->
<!-- </h1> -->

<%-- <P>  The time on the server is ${serverTime}. </P> --%>
<!-- </body> -->
<!-- </html> -->

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
<a href='/edu/login'>로그인</a>&nbsp;&nbsp;<a href='/edu/signon'>회원가입</a>
</c:if>
<c:if test="${id!=null}">
${id}&nbsp;,&nbsp;<a href='/edu/logout'>로그아웃</a>
</c:if>
</body>
</html>