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
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="intro.model.introDao"/>
<jsp:useBean id="dto" class="intro.model.introDto"/>

<jsp:setProperty property="*" name="dto"/>

<%
	String[] hobbies=request.getParameterValues("hobby");
	if (hobbies!=null) {
	    StringBuilder hobbyStr=new StringBuilder();
	    
	    for (String hobby : hobbies) {
	        hobbyStr.append(hobby).append(",");
	    }
	    
	    hobbyStr.delete(hobbyStr.length()-1, hobbyStr.length());
	    
	    dto.setHobby(hobbyStr.toString());
	    
	}else{
	    dto.setHobby("난 취미가 없어유");
	}

	dao.insertIntro(dto);
	
	response.sendRedirect("introList.jsp");
%>
</body>
</html>