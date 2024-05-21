<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.box{
		width: 30px;
		height: 30px;
		border-radius: 100px;
	}
</style>
</head>
<body>
<div style="margin: 100px 100px; width: 1000px;">
	<button type="button" class="btn btn-outline-info" onclick="location.href='writeform'">상품입력</button>
	<br><br>
	<h3 class="alert alert-warning">
		<b>총 ${totalCount }개의 상품이 있음</b>	
	</h3>
	
	<table class="table table-bordered">
		<tr>
			<th width="80">번호</th>
			<th width="150">상품명</th>
			<th width="100">색상</th>
			<th width="200">가격</th>
			<th width="200">입고일</th>
			<th width="200">등록일</th>
			<th width="250">편집</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td>${dto.sangname }</td>				
				<td>
					<div class="box" style="background-color: ${dto.sangcolor}"></div>
				</td>
				<td>
					<fmt:formatNumber value="${dto.sangprice }" type="currency"/>
				</td>
				<td>${dto.sangipgo }</td>
				<td>
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH시"/>
				</td>
				<td>
					<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<form action="delete" method="post" style="display:inline;">
                        <input type="hidden" name="num" value="${dto.num}">
                        <button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
                    </form>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>