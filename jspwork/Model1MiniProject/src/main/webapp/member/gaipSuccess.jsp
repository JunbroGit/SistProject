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
<style type="text/css">
	.center-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
</style>
</head>
<%
	String id=request.getParameter("id");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>
<body>
<div style="margin: 80px 100px;">
	<img src="image/totoro/토토로배경4.jpg" style="width: 400px;"><br>
	<b style="font-size: 2em;"><%=name %>님 회원이 되신걸 환영합니다 :)</b><br>
	<button type="button" class="btn btn-success" onclick="location.href='index?main=login/loginMain.jsp'">로그인</button>
	<button type="button" class="btn btn-success" onclick="location.href='index.jsp'">메인페이지</button>
</div>
</body>
</html>