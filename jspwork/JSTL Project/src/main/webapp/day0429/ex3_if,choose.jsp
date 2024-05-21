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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utd-8"/>
	
	<form action="ex3_if,choose.jsp" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th class="table-light">이름</th>
				<td>
					<input type="text" name="name" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">나이</th>
				<td>
					<input type="text" name="age" class="form-control" style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">부서</th>
				<td>
					<input type="text" name="buseo" class="form-control" style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">급여</th>
				<td>
					<input type="text" name="pay" class="form-control" style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">결과확인</button>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 이름을 입력했을 경우에만 출력
		
		이름: 유재석 님
		나이: 18세(미성년자) (20세이상은 성인, 나머지는 미성년자)
		부서: 경영관리부
		월급여: 화폐단위와 천단위 구분기호
		
		choose (기획부,경영관리부,디자인부)..나머지는 해당부서는 저의 회사에 없네요!!
	 -->
	 
	<hr>
	 
	<c:if test="${!empty param.name }">
		<div class="alert alert-info" style="width: 400px;">
			이름: ${param.name } 님<br>
			나이: ${param.age } 세
			
			<c:if test="${param.age>=20 }">
				<span>(성인)</span>
			</c:if>
			<c:if test="${param.age<20 }">
				<span>(미성년자)</span>
			</c:if>
			<br>
			
			부서: ${param.buseo }
				<c:choose>
					<c:when test="${param.nara=='기획부' }">
						기획부 2층에 있습니다
					</c:when>
					<c:when test="${param.nara=='경영관리부' }">
						경영관리부 3층에 있습니다
					</c:when>
					<c:when test="${param.nara=='디자인부' }">
						디자인부 4층에 있습니다
					</c:when>
					<c:otherwise>
						<h3 style="color: red;">${param.buseo }는 저의 회사에 없는 부서입니다!!</h3>
					</c:otherwise>
				</c:choose>
			월급여: <fmt:formatNumber value="${param.pay }" type="currency"/>
		</div>
	</c:if>
</body>
</html>