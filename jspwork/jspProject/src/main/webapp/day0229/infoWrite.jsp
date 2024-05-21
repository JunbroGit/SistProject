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

	String a=request.getParameter("grade");
	String [] b=request.getParameterValues("Lang");
	String c=request.getParameter("like");
	String d=request.getParameter("height");
	String e=request.getParameter("weight");
	String f=request.getParameter("ipsaday");
%>

<h3 class="alert alert-info">**사원 정보**<br><br>
	최종학력: <b><%=a %></b><br>
	가능언어: <br>
	<%
		if(b==null)
		{%>
			<font color="green">아무 언어도 못해유</font><br>
		<%}else
		{
			for(int i=0;i<b.length;i++)
			{%>
				&nbsp;&nbsp;<b><%=b[i] %></b><br>
			<%}
		}
	%>
	같은 조 하고싶은 사람: <b><%=c %></b><br>
	키: <b><%=d %></b><br>
	몸무게: <b><%=e %></b><br>
	입사일자: <b><%=f %></b>
</h3>
</body>
</html>