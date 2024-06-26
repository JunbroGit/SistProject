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
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<i class="bi bi-envelope-at"></i> &nbsp; hoho@gmail.com<br>
<i class="bi bi-telephone"></i> &nbsp; 02-111-1111<br>
<i class="bi bi-house"></i> &nbsp; 서울시 강남구 역삼동 한독빌딩<br>

<!-- 로그아웃상태는 기본이미지 로그인상태는 로그인한 이미지 나오게 -->
<c:if test="${sessionScope.loginok==null }">
	<img alt="" src="${root }/image/토토로배경2.jpg" width="130" height="130">
</c:if>
<c:if test="${sessionScope.loginok!=null }">
	<img alt="" src="${root }/memberphoto/${sessionScope.loginphoto}" width="130" height="130">
</c:if>
</body>
</html>