<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mem_gaip.model.MemgaipDto"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	img{
		width: 60px;
		border: 1px solid gray;
	}
</style>
<%
	String m_num=request.getParameter("m_num");
	MemgaipDao dao=new MemgaipDao();
	MemgaipDto selecteddto=dao.getData(m_num);
	List<MemgaipDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
</head>
<body>
<div style="margin: 50px 100px; width: 1000px;">
	<b>총 <%=list.size() %>명의 회원이 가입되어있슈</b>
	<button type="button" class="btn btn-warning" onclick="location.href='addForm.jsp'" style="float: right; margin-right: 50px;">회원가입</button>
	<br>
	<table class="table table-bordered">
		<caption align="top">전체 회원 명단</caption>
			<tr class="table-success">
				<th width="80">번호</th>
				<th width="180">아이디</th>
				<th width="180">회원명</th>
				<th width="200">핸드폰</th>
				<th width="200">가입일</th>
				<th width="150">편집</th>
			</tr>
		
		<%
			int i=1;
			for(MemgaipDto dto:list)
			{%>
				<tr>
					<td align="center" valign="middle"><%=i++ %></td>
					<td align="center" valign="middle"><%=dto.getM_id() %></td>
					<td align="center" valign="middle">
						<%
							if(dto.getM_photo()==null)
							{%>
								<img src="../image/연예인이미지/none.png" class="rounded-circle">
							<%}else{%>
								<img src="../<%=dto.getM_photo() %>" class="rounded-circle">
							<%}
						%>
						<br>
						<b><%=dto.getM_name() %></b>
					</td>
					<td align="center" valign="middle"><%=dto.getM_hp() %></td>
					<td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
					<td align="center" valign="middle">
						<button class="btn btn-success" onclick="location.href='updateForm.jsp?m_num=<%=dto.getM_num()%>'"><i class="bi bi-pencil-square"></i></button>
						<button class="btn btn-danger" onclick="location.href='deleteForm.jsp?m_num=<%=dto.getM_num()%>'"><i class="bi bi-trash-fill"></i></button>
					</td>
				</tr>
			<%}
		%>
	</table>
</div>
</body>
</html>