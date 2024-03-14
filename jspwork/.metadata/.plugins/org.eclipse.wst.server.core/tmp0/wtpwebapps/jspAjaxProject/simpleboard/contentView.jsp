<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body *{
		font-family: 'gaegu';
	}
	
	span.day{
		color: #ccc;
		font-size: 0.8em;
	}
</style>
</head>
<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	//dto
	SimpleBoardDto dto=dao.getContent(num);
	//조회수 1증가
	dao.updateReadCount(num);
	//날짜
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div style=" margin: 50px 100px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><b style="font-size: 20pt;"><%=dto.getSubject() %></b></caption>
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b>
				<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
				&nbsp;&nbsp;&nbsp;&nbsp;조회: <%=dto.getReadcount() %>
			</td>
		</tr>
		<tr height="200">
			<td>
				<%=dto.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-outline-info" onclick="location.href='addForm.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='boardList.jsp'"><i class="bi bi-list-ul"></i>목록</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='updatepassForm.jsp?num=<%=num%>'"><i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='deletepassForm.jsp?num=<%=num%>'"><i class="bi bi-trash"></i>삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>