<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 30px 50px;">
	<h3 class="alert alert-danger">MyShop</h3>
	<br>
	<h3 class="alert alert-danger">${totalCount }</h3>
	<table class="table table-bordered" style="width: 800px;">
		<tr>
			<th width="100">상품번호</th>
			<th width="300">상품명</th>
			<th width="200">가격</th>
			<th width="180">입고일</th>
			<th width="180">비고</th>
		</tr>
		
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="5" align="center">
					<b>등록된 상품이 없어</b>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${totalCount>0 }">
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td align="center">${i.count }</td>
					<td>
						<img alt="" src="res/image2/${dto.photo }" width="50" height="50">
						<b>${dto.sangpum }</b>
					</td>
					<td align="center">
						<fmt:formatNumber value="${dto.price }" type="currency"/>
					</td>
					<td align="center">${dto.ipgoday }</td>
					<td align="center">
						<button class="btn btn-info btn-sm">수정</button>
						<button class="btn btn-danger btn-sm">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table> 
</div>
</body>
</html>