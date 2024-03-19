<%@page import="org.json.simple.JSONObject"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String photo=request.getParameter("foodphoto");
	String fname=request.getParameter("foodname");
	String like1=request.getParameter("foodscore1");
	String like2=request.getParameter("foodscore2");
	String like3=request.getParameter("foodscore3");
	
	//총점..String==>int
	int tot=Integer.parseInt(like1)+Integer.parseInt(like2)+Integer.parseInt(like3);
	
	//평균
	double avg=tot/3.0;
	
	//front형태로 만들어서 보내기
	JSONObject ob=new JSONObject();
	ob.put("photo", "../image/음식이미지/"+photo+".jpg");
	ob.put("food", fname);
	ob.put("tot", tot);
	ob.put("avg", avg);
%>

<%=ob.toString() %>
