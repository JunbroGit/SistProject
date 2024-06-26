<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
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
<%
	String num=request.getParameter("num");
	UploadBoardDao dao=new UploadBoardDao();
	//데이타 가져오기
	UploadBoardDto dto=dao.getData(num);
	//조회수 증가
	dao.updateReadCount(num);
	//출력날짜 형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 50px 100px;">
	<h3 class="alert alert-success" style="width: 650px;">게시글 자세히보기</h3>
	<table class="table table-condensed" style="width: 650px;">
		<tr> 
			<td>
				<b><%=dto.getSubject() %></b>
			</td>
			<td style="color: gray; font-size: 9pt;">
				<%=sdf.format(dto.getWriteday()) %>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="color: gray; font-size: 9pt;">
				<%=dto.getWriter() %>
				</span>
				<br><br>
				
				<%=dto.getContent().replace("\n", "<br>") %>
				<br><br>
				
				<a href="../save/<%=dto.getImgname()%>">
				<img src="../save/<%=dto.getImgname()%>" style="max-width: 200px;"></a>
				
				<br><br>
				<b style="color: gray; font-size: 10pt;">조회: <%=dto.getReadcount() %></b>
			</td>
		</tr>
	</table>
		<div style="margin-left: 380px;">
			<button class="btn btn-outline-info" onclick="location.href='addForm.jsp'">글쓰기</button>
			<button class="btn btn-outline-success" onclick="location.href='boardList.jsp'">목록</button>
			<button class="btn btn-outline-warning" onclick="location.href='updateForm.jsp?num=<%=num%>'">수정</button>
			<button class="btn btn-outline-danger" onclick="location.href='deleteForm.jsp?num=<%=num%>'">삭제</button>
		</div>
</div>
</body>
</html>