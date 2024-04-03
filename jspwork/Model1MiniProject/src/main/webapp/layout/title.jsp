<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
    div.cart {
        position: absolute;
        top: -5px;
        right: 300px;
        margin: 20px;
    }

    .carticon {
        font-size: 25px;
       	cursor: pointer;
    }

    .cartcount {
        background-color: forestgreen;
        color: white;
        border-radius: 100px;
        font-size: 15px;
        width: 25px;
        height: 25px;
        line-height: 23px;
        text-align: center;
        position: absolute;
        top: 20px;
        right: -20px;
    }
</style>
<script type="text/javascript">
	$(function(){
		
		$("div.cart").click(function(){
			location.href="index.jsp?main=shop/myCart.jsp";
		});
	});
</script>
</head>
<%
	//프로젝트 경로
	String root=request.getContextPath();
%>
<body>
	<div class="container text-center">
        <a href="<%=root%>" style="color: black; text-decoration: none;">
            <img src="<%=root%>/image/totoro/토토로메인1.jpg" style="width: 300px;">
        </a>
    </div>
	
	<div class="position-absolute top-0 end-0 m-3">
		<%
			//로그인 세션얻기
			String loginOk=(String)session.getAttribute("loginOk");
			//아이디 얻기
			String myId=(String)session.getAttribute("myId");
			
			MemberDao dao=new MemberDao();
			String name=dao.getName(myId);
			
			if(loginOk==null){%>
				<button type="button" class="btn btn-success" style="width: 100px;" onclick="location.href='index.jsp?main=login/loginForm.jsp'">Login</button>
			<%}else{%>
				<b style="font-size: 14pt;"><%=name %>님 로그인중☘️</b>
				<button type="button" class="btn btn-danger" style="width: 100px;" onclick="location.href='index.jsp?main=login/logoutAction.jsp'">Logout</button>
			<%}
		%>
	</div>
	
	<%
		ShopDao sdao=new ShopDao();
		
		//카트개수
		//List<HashMap<String,String>> list=sdao.getCartList(myId);
		int cartSize=sdao.getCartList(myId).size();
	%>
	<div class="cart">
	<i class="bi bi-cart4 carticon"></i>
	<div class="cartcount"><%=cartSize %></div>
	</div>
</body>
</html>