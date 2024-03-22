<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
	//로그인상태
	String loginOk=(String)session.getAttribute("loginOk");
%>

<%
	if(loginOk!=null){%>
		<jsp:include page="guestForm.jsp"/>
		<hr width="650" align="left" style="margin-left: 100px;">
	<%}

	GuestDao dao=new GuestDao();
	
	int totalCount=dao.getTotalCount();
	int perpage=3;
	int perBlock=5;
	int start;
	int startPage;
	int endPage;
	int currentPage;
	int totalPage;
	int no;
	
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	totalPage=totalCount/perpage+(totalCount%perpage==0?0:1);
	
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	if(endPage>totalPage)
		endPage=totalPage;
	
	start=(currentPage-1)*perpage;
	no=totalCount-(currentPage-1)*perpage;
	
	List<GuestDto> list=dao.getList(start, perpage);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String num=request.getParameter("num");
	
	MemberDao mdao=new MemberDao();
	MemberDto mdto=mdao.getDataMember(num);
%>
<body>
<div style="margin: 30px 100px;">
	<b style="font-size: 2em;">방명록 리스트</b>
	<h6><b style="color: gray;">총<%=totalCount %> 개의 글이 있습니다</b></h6>
		<table>
			<%
				if(totalCount==0)
				{%>
					<tr>
						<td>등록된 게시글이 없슈</td>
					</tr>
				<%}else{
					for(int i=0;i<list.size();i++){
						
						GuestDto dto=list.get(i);
						%>
						<tr>
							<td>
								<b><%=mdto.getName() %></b>
							</td>
						</tr>
					<%}
				}

			%>
		</table>

		<ul class="pagination justify-content-center">
		<%
			//이전
			if(startPage>1)
			{%>
				<li class="page-item">
					<a class="page-link" href="boardList.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
				</li>
			<%}
			for(int pp=startPage;pp<=endPage;pp++)
			{
				if(pp==currentPage)
				{%>
					<li class="page-item active">
						<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
					</li>
				<%}else
				{%>
					<li class="page-item">
						<a class="page-link" href="boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
					</li>
				<%}
			}
			
			//다음
			if(endPage<totalPage)
			{%>
				<li class="page-item">
					<a class="page-link" href="boardList.jsp?currentPage=<%=endPage+1%>" style="color: black;">다음</a>
				</li>
			<%}
		%>
		</ul>
</div>
</body>
</html>