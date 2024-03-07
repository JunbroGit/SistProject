<%@page import="intro.model.introDao"%>
<%@page import="intro.model.introDto"%>
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
    // 한글 데이터를 전송할 때 깨짐 방지
    request.setCharacterEncoding("UTF-8");
    
    // 클라이언트로부터 전달된 파라미터 받기
    String num = request.getParameter("num");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String birthday = request.getParameter("birthday");
    String hometown = request.getParameter("hometown");
    String[] hobbyArray = request.getParameterValues("hobby"); // 체크박스로 여러 개 선택 가능하므로 배열로 받음
    String hobby = ""; // 취미는 문자열로 저장
    
    // 취미 배열을 하나의 문자열로 합치기
    if (hobbyArray != null && hobbyArray.length > 0) {
        hobby = String.join(",", hobbyArray); // 취미 사이에 쉼표를 넣어서 문자열로 합침
    }
    
    String memo = request.getParameter("memo");

    // 수정할 DTO 객체 생성 및 파라미터 설정
    introDto dto = new introDto();
    dto.setNum(num);
    dto.setName(name);
    dto.setAge(age);
    dto.setBirthday(birthday);
    dto.setHometown(hometown);
    dto.setHobby(hobby);
    dto.setMemo(memo);
    
    // DAO 객체 생성 및 업데이트 수행
    introDao dao = new introDao();
    dao.updateIntro(dto);

    // 업데이트 후 목록 페이지로 이동
    response.sendRedirect("introList.jsp");
%>
</body>
</html>