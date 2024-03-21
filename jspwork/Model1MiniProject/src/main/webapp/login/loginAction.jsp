<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //체크 안하면 null
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPass(id, pass);
	
	//아이디비번 맞으면 세션3개 저장 / 로그인메인
	if(b){
		session.setMaxInactiveInterval(60*60*8); //8시간..생략시 30분
		
		session.setAttribute("loginOk", "yes");
		session.setAttribute("myId", id);
		session.setAttribute("saveOk", cbsave==null?null:"yes");
		
		response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("아이디 또는 비번이 틀렸어유");
			history.back();
		</script>
	<%}
%>
</body>
</html>