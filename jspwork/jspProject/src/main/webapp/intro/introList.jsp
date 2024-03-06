<%@page import="intro.model.introDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="intro.model.introDao"%>
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
	//db목록 가져오기
	introDao dao=new introDao();
	ArrayList<introDto>list=dao.getAllTeams();
%>
<body>
<div style="margin: 30px 50px;">
	<button type="button" class="btn btn-success" onclick="location.href='addForm.jsp'">팀원 추가</button>
	
	<br>
	<table class="table table-bordered" style="width: 900px;">
		<tr class="table-primary">
			<th width="60">번호</th>
			<th width="120">이름</th>
			<th width="60">나이</th>
			<th width="120">생일</th>
			<th width="100">주거지역</th>
			<th width="150">취미</th>
			<th width="250">성격</th>	
		</tr>
		
		<%
			for(int i=0;i<list.size();i++)
	     	{
	    		introDto dto=list.get(i);
		    	%>
		    	 
		    	<tr>
		    	  <td align="center"><%=i+1 %></td>
		    	  <td><%=dto.getName() %></td>
		    	  <td><%=dto.getAge() %></td>
		    	  <td><%=dto.getBirthday() %></td>
		    	  <td><%=dto.getHometown() %></td>
		    	  <td><%=dto.getHobby() %></td>
		    	  <td><%=dto.getMemo() %></td>
		    	</tr>
		   <%}
		%>
	</table>
</div>
</body>
</html>