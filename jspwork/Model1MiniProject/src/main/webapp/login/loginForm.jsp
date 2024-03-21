<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//세션값 얻기
	String saveOk=(String)session.getAttribute("saveOk");
	String myId="";
	if(saveOk!=null){
		myId=(String)session.getAttribute("myId");
	}
%>
<body>
<div style="margin: 20px 550px;">
	<form action="login/loginAction.jsp" method="post">
		<table class="table table-bordered" style="width: 200px;">
			<caption align="top">세션로그인</caption>
			<tr>
				<td>
					<input type="text" name="id" class="form-control" required="required" placeholder="이이디 입력" style="width: 200px;"  value="<%=myId%>">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass" class="form-control" required="required" placeholder="비밀번호 입력" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="cbsave" <%=saveOk==null?"":"checked" %>>&nbsp;아이디 저장
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-success btn-lg" style="width: 200px;">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>