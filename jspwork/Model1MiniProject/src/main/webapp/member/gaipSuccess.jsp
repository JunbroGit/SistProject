<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
	String root=request.getContextPath();
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getData(num,name);
%>
<body>
<div style="margin: 80px 100px;">
	<img src="<%=root%>/image/totoro/토토로배경4.jpg" style="width: 400px;"><br>
	<b style="font-size: 2em;"><%=dto.getName() %>님 회원이 되신걸 환영합니다 :)</b>
</div>
</body>
</html>