
<%@page import="simpleboard.model.SimpleBoardDao"%>
<%@page import="simpleboard.model.SimpleBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="dao" class="simpleboard.model.SimpleBoardDao"/>
	<jsp:useBean id="dto" class="simpleboard.model.SimpleBoardDto"/>
	<jsp:setProperty property="*" name="dto"/>
<% 
	dao.insertSimpleBoard(dto);

	//response.sendRedirect("boardList.jsp");
	
	//인서트 후 내용보기로 이동하려면 방금 insert된 num값을 알아야한다
	int num=dao.getMaxnum();
	response.sendRedirect("contentView.jsp?num="+num);
%>

</body>
</html>
