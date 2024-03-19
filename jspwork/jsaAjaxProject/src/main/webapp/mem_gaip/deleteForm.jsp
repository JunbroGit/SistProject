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
<%
	String m_num=request.getParameter("m_num");
%>
</head>
<body>
<div style="margin: 200px 200px;">
	<form action="deleteMember.jsp">
	<input type="hidden" name="m_num" value="<%=m_num%>">
		<table class="table table-bordered" style="width: 300px;">
			<caption align="top">삭제비밀번호 입력</caption>
			<tr>
				<td>
					비밀번호를 입력해 주세요
					<input type="password" class="form-control" name="m_pass" required="required" style="width: 150px;">
					
					<br><br>
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-success" onclick="history.back()">이전</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>