<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 20px 400px;">
	<img src="image/totoro/토토로로고1.png" style="width: 500px;">
	
	<%
		String myId=(String)session.getAttribute("myId");
		MemberDao dao=new MemberDao();
		String name=dao.getName(myId);
	%>
	
	<br><br>
	
	<b><%=name %>님 로그인중</b>
	<button type="button" class="btn btn-danger" onclick="location.href='login/logoutAction.jsp'">로그아웃</button>
</div>
</body>
</html>