<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	.col{
		border: 1px solid gray;
		margin-right: 20px;
		margin-top: 10px;
		max-width: 200px;
		max-height: 400px;
	}
	
	.col img{
		width: 180px;
		height: 200px;
	}
	
	.col b{
		font-family: 'Dongle';
		font-size: 1.6em; 
	}
    
    .col span{
    	color: gray;
    	font-family: 'Dongle';
    	font-size: 1.2em;
    }
</style>
</head>
<%
	UploadBoardDao dao=new UploadBoardDao();
	List<UploadBoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%>
<body>
<div style="margin: 50px 100px; width: 1000px;">
	<button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">게시글 추가</button>
	<button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp'">일반 목록</button>
	<div class="row">
	<%
		for(int i=0;i<list.size();i++) {
			
			UploadBoardDto dto=list.get(i);
		%>
			<div class="col">
				<a href="content.jsp?num=<%=dto.getNum() %>" style="text-decoration: none; color: black;">
				<img src="../save/<%=dto.getImgname()%>"><br>
				<b><%=dto.getSubject() %></b></a><br>
				<span>작성자: <%=dto.getWriter() %></span><br>
				<span><%=sdf.format(dto.getWriteday()) %></span>
				<span>•조회 <%=dto.getReadcount() %></span>
			</div>
		<%
		}
	%>
	</div>
</div>
</body>
</html>