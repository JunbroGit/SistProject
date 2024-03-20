<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
	//프로젝트 경로
	String root=request.getContextPath();
%>
<body>
<div style="font-size: 14pt; line-height: 35px;">
	<i class="bi bi-person-fill"></i>TOTORO<br>
	<i class="bi bi-telephone-fill"></i>02-123-1234<br>
	<i class="bi bi-house-fill"></i>일본 숲 어딘가<br>
	<i class="bi bi-envelope-fill"></i>totoro@gmail.com<br>
	<i class="bi bi-instagram"></i>totoro_Official<br>
	<i class="bi bi-camera-fill"></i><img src="<%=root%>/image/totoro/토토로2.gif" style="border-radius: 100px; width: 100px;">
</div>
</body>
</html>