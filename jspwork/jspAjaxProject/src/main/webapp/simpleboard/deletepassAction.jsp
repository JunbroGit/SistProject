<%@page import="simpleboard.model.SimpleBoardDao"%>
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
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	SimpleBoardDao dao=new SimpleBoardDao();
	
	boolean check=dao.isPassCheck(num, pass);
	
	if(check){
		dao.deleteSimpleBoard(num);
		%>
		<script type="text/javascript">
			alert("삭제되었습니다\n목록으로 이동해유")
			location.href='boardList.jsp';
		</script>
	<%}else{%> 
		<script type="text/javascript">
		alert("비밀번호가 틀렸어유");
        history.back();
		</script>
	<%}
%>
</body>
</html>