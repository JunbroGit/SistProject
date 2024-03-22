<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
    
<script type="text/javascript" src="menu/js/jquery.js"></script>
<script type="text/javascript" src="menu/js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
	//프로젝트 경로
	String root=request.getContextPath();

	String loginOk=(String)session.getAttribute("loginOk");	
	String myId=(String)session.getAttribute("myId");
	
%>
<body>
	<!-- <a href="<%=root%>/">메인</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;
	<a href="index.jsp?main=member/addForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">Q & A</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">방명록</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">숲게시판</a>&nbsp;&nbsp;&nbsp; -->
	
	<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root%>">Home</a></li>
					<li class="parent">
						<a href="#">게시판</a>
						<ul class="sub-menu">
							<li><a href="#">회원게시판</a></li>
							<li><a href="#">숲게시판</a></li>
							<li><a href="#">이미지게시판</a></li>
						</ul>
					</li>
					<li><a href="#">회원</a>
						<ul class="sub-menu">
							<li><a href="index.jsp?main=member/addForm.jsp">회원가입</a></li>
							
							<%
								if(loginOk!=null && myId.equals("totoro")){%>
									<li><a href="index.jsp?main=member/memberList.jsp">회원목록</a></li>
								<%}
							%>
							
							<li><a href="index.jsp?main=member/myPage.jsp">마이페이지</a></li>
						</ul>
					</li>
					<li class="parent">
						<a href="#">방명록</a>
						<ul class="sub-menu">
							<li><a href="#">회원방명록</a></li>
							<li><a href="#">비회원방명록</a></li>
						</ul>
					</li>
					<li><a href="#">About Forest</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
	
</body>
</html>