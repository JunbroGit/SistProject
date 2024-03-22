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
	//프로젝트 경로
	String root=request.getContextPath();
%>
<body>
	<div class="container text-center">
        <a href="<%=root%>" style="color: black;">
            <img src="<%=root%>/image/totoro/토토로메인1.jpg" style="width: 300px;">
        </a>
    </div>
	
	<div class="position-absolute top-0 end-0 m-3">
		<%
			//로그인 세션얻기
			String loginOk=(String)session.getAttribute("loginOk");
			//아이디 얻기
			String myId=(String)session.getAttribute("myId");
			
			MemberDao dao=new MemberDao();
			String name=dao.getName(myId);
			
			if(loginOk==null){%>
				<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='index.jsp?main=login/loginForm.jsp'">Login</button>
			<%}else{%>
				<b style="font-size: 14pt;"><%=name %>님 로그인중☘️</b>
				<button type="button" class="btn btn-danger" style="width: 100px;" onclick="location.href='index.jsp?main=login/logoutAction.jsp'">Logout</button>
			<%}
		%>
	</div>
</body>
</html>