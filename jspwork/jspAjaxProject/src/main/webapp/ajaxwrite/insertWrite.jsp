<%@page import="ajaxwrite.model.AjaxWriteDao"%>
<%@page import="ajaxwrite.model.AjaxWriteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식
	request.setCharacterEncoding("utf-8");
	  
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String story=request.getParameter("story");
	String image=request.getParameter("image");
	  
	//dto
	AjaxWriteDto dto=new AjaxWriteDto();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setStory(story);
	dto.setImage(image);
	  
	//dao
	AjaxWriteDao dao=new AjaxWriteDao();
	
	//insert
	dao.insertWrite(dto);
%>