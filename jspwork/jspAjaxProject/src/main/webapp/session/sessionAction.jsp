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

	//세션이 있는지 확인,확인후 없으면 선물 꽝!!
	String msg=(String)session.getAttribute("msg");
	String gift=request.getParameter("gift");
	
	if(msg==null || !msg.equals("happy")) 
	{%>
		<h3 style="color: red;">시간초과로 꽝이여유</h3>
	<%}else
	{%>
		<h3 style="color: green;">축하혀유 <%=gift %>선물을 받겠구만유</h3>
	<%}
%>

<a href="sessionMain.jsp">다시선택</a>
</body>
</html>