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
	String num=request.getParameter("num");
%>
<body>
<div style="margin: 80px 200px; width: 300px;">
	<form action="member/updatePassAction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<b>수정시 필요한 비밀번호를 입력해유</b>
		<div class="d-inline-flex">
			<input type="password" class="form-control" required="required" name="pass" style="width: 150px;">
		</div>
		<br><br>
		<button type="submit" class="btn btn-primary" style="margin-left: 10px;">수정</button>
	</form>
</div>
</body>
</html>