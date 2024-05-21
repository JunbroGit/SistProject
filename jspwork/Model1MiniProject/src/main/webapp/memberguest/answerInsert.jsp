<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//data읽어서 dto넣기
	AnswerGuestDto dto=new AnswerGuestDto();
	dto.setNum(request.getParameter("num"));
	dto.setMyid(request.getParameter("myid"));
	dto.setContent(request.getParameter("content"));
	
	//페이지 번호 읽기
	String currentPage=request.getParameter("currentPage");
	
	//db에저장
	AnswerGuestDao dao=new AnswerGuestDao();
	dao.insertAnswer(dto);

	response.sendRedirect("../index.jsp?main=memberguest/guestList.jsp?currentPage="+currentPage);
%>