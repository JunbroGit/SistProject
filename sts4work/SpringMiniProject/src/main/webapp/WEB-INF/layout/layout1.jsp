<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
	div.layout div{
	  border: 0px solid black;
	}
	
	div.layout div.title{
	  position: absolute;
	  top: 10px;
	  left: 500px;
	  height: 100px;
	}
	
	div.layout div.menu{
	  position: absolute;
	  top: 200px;
	  left: 200px;
	  height: 100px;
	}
	
	div.layout div.info{
	  position: absolute;
	  top: 300px;
	  left: 30px;
	  height: 300px;
	  width: 180px;
	  border: 5px solid forestgreen;
	  border-radius: 30px;
	  pause: 30px 20px;
	}
	
	div.layout div.main{
	  position: absolute;
	  top: 300px;
	  left: 230px;
	  width: 1200px;
	  height: 1000px;
	}
</style>
</head>
<body>
<div class="layout">
	<div class="title">
		<tiles:insertAttribute name="title"/>
	</div>
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="info">
		<tiles:insertAttribute name="info"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
</div>
</body>
</html>