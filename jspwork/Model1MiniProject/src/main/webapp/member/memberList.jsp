<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDto"%>
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
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 80px 100px;width: 900px;">
	<h5 class="alert alert-success">총 <%=list.size() %>명의 회원이 있슈</h5>
	<table class="table table-bordered">
		<caption align="top"><b>전체 회원명단</b></caption>
			<tr class="table-light" align="center">
				<th width="80">번호</th>
				<th width="120">이름</th>
				<th width="150">아이디</th>
				<th width="220">핸드폰</th>
				<th width="280">주소</th>
				<th width="220">이메일</th>
				<th width="180">가입일</th>
				<th width="120">비고</th>
			</tr>
			
			<%
				int no=1;
				for(MemberDto dto:list)
				{%>
					<tr align="center">
						<td align="center"><%=no++ %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getId() %></td>
						<td><%=dto.getHp() %></td>
						<td><%=dto.getAddr() %></td>
						<td><%=dto.getEmail() %></td>
						<td><%=sdf.format(dto.getGaipday()) %></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm" onclick="location.href='member/memberDelete.jsp?num=<%=dto.getNum()%>'">강퇴</button>
						</td>
					</tr>
				<%}
			%>
	</table>
</div>
</body>
</html>