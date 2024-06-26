<%@page import="simpleboard.model.SimpleBoardDto"%>
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
<style type="text/css">
	body *{
		font-family: 'gaegu';
	}
</style>
<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	SimpleBoardDto dto=dao.getContent(num); 
%>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="updateAction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
		<caption><b style="font-size: 1.4em;">글 수정</b></caption>
		<table class="table table-bordered">
			<tr>
				<th width="100" class="table-primary">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control" style="width: 120px;" required="required" value="<%=dto.getWriter()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-primary">제목</th>
				<td>
					<input type="text" name="subject" class="form-control" style="width: 300px;" required="required" value="<%=dto.getSubject()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;" name="content" class="form-control" required="required"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="image" src="../image/logo_img/submit.png" style="width: 60px; height: 60px;">
					<input type="image" src="../image/logo_img/list.png" style="width: 60px; height: 60px;" onclick="location.href='boardList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>