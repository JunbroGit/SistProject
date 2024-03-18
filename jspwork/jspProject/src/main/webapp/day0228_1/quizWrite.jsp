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
	request.setCharacterEncoding("utf-8"); //한글깨짐방지

	String name=request.getParameter("name");
	String ipsaday=request.getParameter("ipsaday");
	String lcmenu=request.getParameter("lunch");
	String []wtfood=request.getParameterValues("wtfood");
%>

<h3 class="alert alert-info">
	사원명: <%=name %><br>
	입사일자: <%=ipsaday %><br>
	오늘 선택 점심메뉴: <img src="<%=lcmenu %>" width="100"><br>
	건의하는 메뉴: 
		<%
			if(wtfood==null)
			{%>
				<font color="red">원하는 메뉴없음</font>
			<%}else
			{
				for(int i=0;i<wtfood.length;i++)
				{%>
					[<%=wtfood[i] %>]&nbsp;
				<%}
			}
		%> 
</h3>
</body>
</html>