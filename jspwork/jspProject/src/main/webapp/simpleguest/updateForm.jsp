<%@page import="simpleguest.model.GuestDto"%>
<%@page import="simpleguest.model.GuestDao"%>
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
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData(num); 
%>
<body>
<div style="margin: 50px 100px;">
	<form action="updateAction.jsp" method="post">
		<table class="table table-bordered" style="width: 550px;">
			<caption align="top"><b>방명록 수정</b></caption>
			<tr>
				<th width="100" class="table-primary">닉네임</th>
				<td>
					<input type="text" name="nickname" required="required" class="form-control" style="width: 120px;" value="<%=dto.getNickname()%>">
				</td>
				<th width="100" class="table-primary">비밀번호</th>
				<td>
					<input type="password" name="pass" required="required" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th>아바타</th>
				<td colspan="4">
					<%
						for(int i=1;i<=10;i++)
						{
							int n=Integer.parseInt(dto.getImage());
						%>
							<input type="radio" name="image" value="<%=i%>" <%=i==n?"checked":"" %> style="width: 35px;">
						<%}
					%>
					<br>
					<%
						for(int i=1;i<=10;i++)
						{%>
							<img src="../image/avata/b<%=i%>.png" style="width: 35px;">
						<%}
					%>
				</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<textarea style="width: 530px; height: 100px;" name="content" class="form-control"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="<%=num%>">
					<input type="submit" value="저장" class="btn btn-outline-primary" style="width: 100px;">
					<input type="button" value="방명록" class="btn btn-outline-success" style="width: 100px;" onclick="location.href='guestList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>