<%@page import="java.sql.Date"%>
<%@page import="myinfo.db.MyinfoDao"%>
<%@page import="myinfo.db.MyinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String blood=request.getParameter("blood");
	String birth=request.getParameter("birth");
	
	MyinfoDto dto=new MyinfoDto();
	dto.setName(name);
	dto.setHp(hp);
	dto.setBlood(blood);
	dto.setBirth(birth);
	
	MyinfoDao dao=new MyinfoDao();
	dao.insertMyInfo(dto);
	
	response.sendRedirect("infoList.jsp");
%>