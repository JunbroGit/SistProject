<%@page import="myworld.model.WorldDao"%>
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
	WorldDao dao=new WorldDao();
	String num=request.getParameter("num");
	dao.deleteWorld(num);
%>
</body>
<<<<<<< HEAD
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> 5d1692f77e6cf40a0a83f743137a408426ce9f3f
=======
</html>
>>>>>>> 2f32182e4b4bad3d0217dd61f4b340ef556cf143
