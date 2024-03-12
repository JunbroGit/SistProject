<%@page import="quizshop.model.QuizShopDto"%>
<%@page import="quizshop.model.QuizShopDao"%>
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
	String num = request.getParameter("num");
	QuizShopDao dao=new QuizShopDao();
	QuizShopDto dto=dao.getOneShop(num);
%>
<body>
	<!-- 이미지가 크게 나오고 옆에 설명추가
	     상품명   가격   입고일
	     
	     맨아래 목록,수정,삭제 버튼 3개 추가 -->
	     
<div style="margin: 50px 50px; width: 500px;">
	<h3 class="alert alert-success">상품 자세히보기</h3>
	<br>
	<table class="table table-bordered">
		<tr class="table-success">
			<th width="60">상품이미지</th>
			<th width="100">상품명</th>
			<th width="100">가격</th>
			<th width="150">입고일</th>
		</tr>
		<tr>
			<td><img src="../image/쇼핑몰이미지/<%=dto.getPhoto() %>.jpg" width="150px;"></td>
			<td style="vertical-align: middle;"><%=dto.getSang_name() %></td>
			<td style="vertical-align: middle;"><%=dto.getPrice() %>원</td>
			<td style="vertical-align: middle;"><%=dto.getIpgoday() %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button class="btn btn-success" onclick="location.href='shopList.jsp'">목록</button>
				<button class="btn btn-warning">수정</button>
				<button class="btn btn-danger">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>