<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function funcdel(num,currentPage){
	   
	   //alert(num+","+currentPage);
	   
	   var ans=confirm("삭제할거에유?");
	   
	   if(ans){
		   location.href='smartboard/delete.jsp?num='+num+"&currentPage="+currentPage;
	   }
	   
}
</script>
</head>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	dao.updateReadcount(num);
	
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><b><%=dto.getSubject() %></b></caption>
		
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
				&nbsp;&nbsp;  조회 <%=dto.getReadcount() %>
			</td>
		</tr>
		<tr>
			<td height="150">
				<%=dto.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<b class="acount">댓글<span>0</span></b>
				<div>
					댓글목록
				</div>
				<div class="aform d-inline-flex">
					<input type="text" id="nickname" class="form-control" style="width: 100px;" placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width: 300px;" placeholder="댓글메세지">
					<button type="button" class="btn btn-info" style="margin-left: 10px;">저장</button>
				</div>
			</td>
		</tr>
		<tr>
			<td style="float: right;">
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='index.jsp?main=smartboard/smartForm.jsp'"><i class="bi bi-pen"></i>글쓰기</button>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=smartboard/boardList.jsp'"><i class="bi bi-card-list"></i>목록</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="location.href='index.jsp?main=smartboard/updateForm.jsp?num=<%=num%>&currentPage=<%=currentPage%>'"><i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" class="btn btn-danger btn-sm" onclick="funcdel(<%=num%>,<%=currentPage%>)"><i class="bi bi-trash"></i>삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>