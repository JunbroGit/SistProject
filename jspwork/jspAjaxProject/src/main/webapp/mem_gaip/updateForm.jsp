<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
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
<%
	String m_num=request.getParameter("m_num");
	MemgaipDao dao=new MemgaipDao();
	MemgaipDto dto=dao.getData(m_num);
%>
</head>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="updateMember.jsp" method="post" enctype="multipart/form-data" name="mfrm">
	<input type="hidden" name="m_num" value="<%=m_num%>">
		<table class="table table-bordered">
			<caption align="top"><b>회원정보수정</b></caption>
			<tr>
				<td width="120" class="table-primary">아이디</td>
				<td>
					<b><%=dto.getM_id()%></b>
				</td>
			</tr>
			<tr>
				<td width="120" class="table-primary">회원명</td>
				<td>
					<input type="text" class="form-control" style="width: 120px;" name="m_name" required="required" value="<%=dto.getM_name()%>">
				</td>
			</tr>
			<tr>
				<td width="120" class="table-primary">사진</td>
				<td>
					<input type="file" class="form-control" style="width: 200px;" name="m_photo" value="<%=dto.getM_photo()%>">
				</td>
			</tr>
			<tr>
				<td width="120" class="table-primary">핸드폰</td>
				<td>
					<input type="text" class="form-control" style="width: 180px;" name="m_hp" required="required" value="<%=dto.getM_hp()%>">
				</td>
			</tr>
			<tr>
				<td width="120" class="table-primary">비밀번호</td>
				<td>
					<input type="password" class="form-control" style="width: 120px;" name="m_pass" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-warning" onclick="history.back()"><i class="bi bi-back"></i></button>
					<button type="submit" class="btn btn-success" id="btnupdate"><i class="bi bi-pencil-square"></i></button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>