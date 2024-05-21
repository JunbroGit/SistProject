<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.AnswerGuestDao"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
  span.day{
     float: right;
     font-size: 14pt;
     color: gray;
  }
  
  i.mod,i.del{
  	cursor: pointer;
  }
</style>
<script type="text/javascript">
	$(function(){
		
		$("span.likes").click(function(){
			
			var num=$(this).attr("num");
			//alert(num);
			var tag=$(this);
			console.log({num});
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"memberguest/updateIncreChu.jsp",
				data:{"num":num},
				success:function(data){
					console.log({data});
					//alert(data.chu);
					tag.next().text(data.chu);
					
					tag.next().next().animate({"font-size":"10px"},1000,function(){
						//에니메이션 끝난후
						$(this).css("font-size","0px");
					});
				}
			});
		});
		
		//삭제
		$("i.del").click(function(){
			
			var num=$(this).attr("num");
			var currentPage=$(this).attr("currentPage");
			
			//alert(num+","+currentPage);
			
			var yes=confirm("정말 삭제할거여유?");
			
			if(yes){
				location.href='memberguest/delete.jsp?num='+num+'&currentPage='+currentPage;
			}
		});
		
		//댓글부분은 처음에는 안보이게 처리
		$("div.answer").hide();
		
		//댓글 클릭시 댓글부분이 보였다 안보였다
		$("span.answer").click(function(){
			//$("div.answer").toggle();
			$(this).parent().find('div.answer').toggle();
		});
		
		//댓글삭제
		$("i.adel").click(function(){
			
			var a=confirm("삭제할거에유?")
			
			if(a){
				var idx=$(this).attr("idx");
				//alert(idx);
				
				$.ajax({
					type:"get",
					dataType:"html",
					url:"memberguest/deleteAnswer.jsp",
					data:{"idx":idx},
					success:function(){
						location.reload(); //새로고침
					}
				});
			}
		});
		
		//수정아이콘 누르면 모달창
		$("i.aedit").click(function(){
			
			var idx=$(this).attr("idx");
			//alert(idx);
			
			$("#idx").val(idx);
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"memberguest/answerContent.jsp",
				data:{"idx":idx},
				success:function(res){
					$("#idx").val(res.idx);
					$("#ucontent").val(res.story);
				}
			});
		});
		
		//댓글 수정
		$("#btnUpdate").click(function(){
			var idx=$("#idx").val();
			var content=$("#ucontent").val();
			
			//alert(idx+","+content);
			
			$.ajax({
				type:"post",
				url:"memberguest/updateAnswer.jsp",
				dataType:"html",
				data:{"idx":idx,"content":content},
				success:function(){
					location.reload();
				}
			});
		});
	});
</script>
</head>
<%
	//로그인상태
	String loginOk=(String)session.getAttribute("loginOk");

	GuestDao dao=new GuestDao();
	//전체갯수
	int totalCount=dao.getTotalCount();
	int perPage=3; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1년)
	int startPage; //각 블럭당 보여질 시작페이지
	int endPage; //각 블럭당 보여질 끝페이지
	int currentPage; //현제페이지
	int totalPage; //총페이지 수
	int no; //각 페이지당 출력할 시작번호
	
	//현제페이지 읽는데 단 null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총페이지수 구한다
	//총글갯수/한페이당 보여질 갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각 블럭당 보여질 시작페이지
	//perBlock=5일경우 현제페이지가 1~5일경우 시작페이지가 1,끝페이지가 5
	//현제가 13일경우 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//총페이지가 23일경우 마지막블럭은 끝페이지 25가 아니라 23
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각 페이지에서 보여질 시작번호
	//1페이지:0 2페이지:5 3페이지:10...
	startNum=(currentPage-1)*perPage;
	
	//각 페이당 출력할 시작번호 구하기
	//총글갯수가 23 , 1페이지:23 2페이지:18 3페이지:13
	no=totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<GuestDto> list=dao.getList(startNum, perPage);
	
	if(list.size()==0 && currentPage!=1){
		%>
		<script type="text/javascript">
			location.href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=currentPage-1%>";
		</script>
	<%}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	if(loginOk!=null){%>
		<jsp:include page="guestForm.jsp"/>
		<hr width="650" align="left" style="margin-left: 100px;">
	<%}
%>
<body>
<div style="margin: 30px 100px;">
	<b style="font-size: 1.8em;">방명록 리스트</b>
	<h6><b style="color: gray;">총<%=totalCount %> 개의 글이 있습니다</b></h6>
	<%
		MemberDao mdao=new MemberDao();
		for(GuestDto dto:list){
			
			String name=mdao.getName(dto.getMyid());
			%>
			
			<table class="table table-bordered" style="width: 580px;">
				<tr>
					<td>
						<b><i class="bi bi-person-circle"></i>&nbsp;<%=name %>(<%=dto.getMyid() %>)</b>
						
						<%
							String myId=(String)session.getAttribute("myId");
						
							if(loginOk!=null && dto.getMyid().equals(myId)){
								%>
								<span style="margin-left: 340px;">
									<i class="bi bi-pencil-square mod" onclick="location.href='index.jsp?main=memberguest/updateForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
									<i class="bi bi-trash del" num="<%=dto.getNum() %>" currentPage="<%=currentPage %>"></i>
								</span>
							<%}
						%>
						<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					</td>
				</tr>
				<tr>
					<td>
						<%
							if(dto.getPhotoname()!=null){%>
								<a href="save/<%=dto.getPhotoname()%>)" target="blank">
									<img src="save/<%=dto.getPhotoname()%>" align="left" style="width: 100px;" hspace="20">
								</a>
							<%}
						%>
						
						<%=dto.getContent().replace("\n", "<br>")%>
					</td>
				</tr>
				<tr>
					<td>
					
					<%
						//각 방명록에 달린 댓글 목록 가져오기
						AnswerGuestDao adao=new AnswerGuestDao();
						List<AnswerGuestDto> alist=adao.getAllAnswers(dto.getNum());
					%>
					
						<span class="answer" style="cursor: pointer;">댓글 <%=alist.size() %></span>
						<span class="likes" style="margin-left: 10px; cursor: pointer;" num=<%=dto.getNum() %>>추천</span>
						<span class="chu"><%=dto.getChu() %></span>
						<i class="bi bi-heart-fill" style="font-size: 0px; color: pink;"></i>
						
						<div class="answer">
							<%
								if(loginOk!=null){%>
									<div class="answerForm">
										<form action="memberguest/answerInsert.jsp" method="post">
										<input type="hidden" name="num" value="<%=dto.getNum()%>">
										<input type="hidden" name="myid" value="<%=myId%>">
										<input type="hidden" name="currentPage" value="<%=currentPage%>">
											<table>
												<tr>
													<td width="500">
														<textarea style="width: 480px; height: 70px;" name="content" required="required" class="form-control"></textarea>
													</td>
													<td>
														<button type="submit" class="btn btn-success" style="width: 70px; height: 70px;">등록</button>
													</td>
												</tr>
											</table>
										</form>
									</div>
								<%}
							%>
							<div class="answerList">
								<table style="width: 500px;">
									<%
										for(AnswerGuestDto adto:alist){%>
											<tr>
												<td>
													<i class="bi bi-person"></i>
													<%
														//작성자명
														String aname=mdao.getName(adto.getMyid());
													%>
													
													<b style=""><%=aname %></b>
													
													<%
														//글작성자와 댓글작성자가 같을 경우
														if(dto.getMyid().equals(adto.getMyid())){%>
															<span style="color: green">작성자</span>
														<%}
													%>
													
													<span style="font-size: 12pt; color: gray; margin-left: 20px;"><%=sdf.format(adto.getWriteday()) %></span>
													
													<%
														if(loginOk!=null && adto.getMyid().equals(myId)){%>
															<i class="bi bi-pencil-square aedit" idx="<%=adto.getIdx()%>" data-bs-toggle="modal" data-bs-target="#myModal"></i>
															<i class="bi bi-trash adel" idx="<%=adto.getIdx()%>"></i>
														<%}
													%>
													<br>
													
													<span><%=adto.getContent().replace("\n", "<br>") %></span>
												</td>
											</tr>
										<%}
									%>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		<%}
	%>
</div>

<div style="width: 580px; text-align: center; margin: 30px 100px;">
	<ul class="pagination justify-content-center">
	<%
		//이전
		if(startPage>1)
		{%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
			</li>
			<%}
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="page-item active">
					<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else
			{%>
				<li class="page-item">
					<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}
		}
			
		//다음
		if(endPage<totalPage)
		{%>
			<li class="page-item">
				<a class="page-link" href="index.jsp?main=memberguest/guestList.jsp?currentPage=<%=endPage+1%>" style="color: black;">다음</a>
			</li>
		<%}
	%>
	</ul>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<div class="updateForm d-inline-flex">
      		<input type="hidden" id="idx">
      		<input type="text" id="ucontent" class="form-control" style="width: 350px;">
      		<button type="button" class="btn btn-success" id="btnUpdate" style="margin-left: 10px;">댓글수정</button>
      	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>