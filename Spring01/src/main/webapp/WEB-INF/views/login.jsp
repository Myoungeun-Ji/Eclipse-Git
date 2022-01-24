<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <form method=post action="/edu/doLogin" id=frmLogin> -->
<!-- <table> -->
<%-- <tr><td>아이디 : </td><td><input type=text id=userid name=userid value="${userid}"></td></tr> --%>
<%-- <tr><td>비밀번호 : </td><td><input type=password id=passcode name=passcode value="${passcode}"></td></tr> --%>
<!-- <tr><td colspan=2> -->
<!-- 	<input type=submit value='로그인'>&nbsp;&nbsp; -->
<!-- 	<input type=reset value='취소' ></td> -->
<!-- </table> -->

<!-- </form> -->
<!-- </body> -->
<!-- <img src="animal/cat1.jfif"> -->
<!-- </html> -->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>login</title>
</head>
<body>
<h1>로그인 페이지</h1><hr>
<form method=GET action="/edu/doLogin">
<table>
<tr><td >아이디</td><td><input type=text name=userid id=userid value="${userid}"></td></tr>
<tr><td>비밀번호</td><td><input type=text name=passcode id=passcode value="${passcode}"></td></tr>
<tr><td colspan=2><input type=submit value='로그인'>&nbsp;&nbsp;
              <button type="button" id=sub2 value='취소'>취소</button>
</td></tr>
</table>
<img src="animal/cat1.jfif">
</form>
</body>
</html>