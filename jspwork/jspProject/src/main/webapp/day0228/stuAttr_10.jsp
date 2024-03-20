<%@page import="test.Student"%>
<%@page import="java.util.Vector"%>
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
	<h3>request에 Vector 저장 후 불러오는 연습</h3>
	
	<%
		Vector<Student> list=new Vector<>();
		list.add(new Student("유재석","구로구",98));
		list.add(new Student("박명수","강남구",88));
		list.add(new Student("정준하","강서구",76));
		list.add(new Student("정형돈","영등포구",92));
		list.add(new Student("노홍철","양천구",94));
		
		//데이타 vector를 request에 저장
		request.setAttribute("list", list);
		
		//페이지이동2: forward(url주소안바뀜)  redirect(url주소바뀜)
	%>
	
	<jsp:forward page="stuForward_10.jsp"/>
</body>
</html>