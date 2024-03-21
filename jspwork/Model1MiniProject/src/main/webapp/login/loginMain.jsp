<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션에 저장된 loginOk가져온다
	String loginOk=(String)session.getAttribute("loginOk");
	
	if(loginOk==null){ //로그아웃상태
		%>
		<jsp:include page="loginForm.jsp"/>
	<%}else{%>
		<jsp:include page="logoutForm.jsp"/>
	<%}
%>
</body>
</html>