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
	<h1 class="alert alert-info" style="width: 1000px;">자기소개</h1>
	<table class="table table-bordered" style="width: 900px;">
		<tr class="table-primary">
			<th width="60">번호</th>
			<th width="100">이름</th>
			<th width="60">나이</th>
			<th width="120">생년월일</th>
			<th width="200">자세히보기</th>
		</tr>
		
		<%
			if(list.size()==0){%>
				
				<tr>
		    	  <td colspan="5" align="center">
		    	  	<h3>자기소개가 없습니다</h3>
		    	  </td>
		    	</tr>
			<%}else{
				for(int i=0;i<list.size();i++){
					
					introDto dto=list.get(i);
					%>
			    	 
			    	<tr>
			    	  <td align="center"><%=i+1 %></td>
			    	  <td align="center"><%=dto.getName() %></td>
			    	  <td align="center"><%=dto.getAge() %></td>
			    	  <td align="center"><%=dto.getBirthday() %></td>
			    	  <td align="center"><button type="button" class="btn btn-info" onclick="location.href='detailPage.jsp?num=<%=dto.getNum()%>'">자세히보기</button></td>
			    	</tr>
			   <%}
				}	    	
		%>
	</table>
	
	<button type="button" class="btn btn-success" onclick="location.href='addForm.jsp'">추가</button>
</div>
</body>
</html>