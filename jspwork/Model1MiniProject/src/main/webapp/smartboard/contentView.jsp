<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	span.aday{
		float: right;
		font-size: 1.0em;
		color: #bbb;
	}
	
	div.alist{
		margin-left: 20px;
		font-size: 1.0em;
		color: #bbb;
	}
	
	span.day{
		color: #bbb;
		font-size: 1.0em;
	}
	
	span.icon{
		margin-left: 10px;
		color: green;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		list();
		
		var num=$("#num").val();
		//alert(num);
		
		$("#btnsend").click(function(){
			
			var nick=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nick.length==0){
				alert("닉네임 입력하셔유");
				return;
			}
			if(content.length==0){
				alert("댓글 입력하셔유");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"smartanswer/insertAnswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nick,"content":content},
				success:function(){
					
					//alert("success!");
					//초기화
					$("#nickname").val('');
					$("#content").val('');
					
					list();
				}
			});
		});
		
		//삭제
		$(document).on("click","i.adel",function(){
			
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var ans=confirm("댓글 삭제할거에유?");
			
			if(ans){
				
				$.ajax({
					type:"get",
					url:"smartanswer/deleteAnswer.jsp",
					dataType:"html",
					data:{"idx":idx},
					success:function(){
						swal("삭제성공!", "삭제했어유", "success");
						list();
					}
				});
			}
		});
		
		//수정폼에 데이타 띄우기
		$(document).on("click","i.amod",function(){
			
			idx=$(this).attr("idx");
			//alert(idx);
			
			$.ajax({
				type:"get",
				url:"smartanswer/jsonUpdateForm.jsp",
				dataType:"json",
				data:{"idx":idx},
				success:function(res){
					
					$("#unickname").val(res.nickname);
					$("#ucontent").val(res.content);
				}
			});
			
			$("#myModal").modal("show");
		});
		
		//수정
		$(document).on("click","#btnUpdate",function(){
			
			var nickname=$("#unickname").val();
			var content=$("#ucontent").val();
			//alert(nickname+","+content);
			
			$.ajax({
				type:"get",
				url:"smartanswer/updateAnswer.jsp",
				dataType:"html",
				data:{"idx":idx,"nickname":nickname,"content":content},
				success:function(){
					list();
				}
			});
		});
		
	});

	function funcdel(num,currentPage){
	   
	   //alert(num+","+currentPage);
	   
	   var ans=confirm("삭제할거에유?");
	   
	   if(ans){
		   location.href='smartboard/delete.jsp?num='+num+"&currentPage="+currentPage;
	   }
	   
	}
	
	function list(){
		
		console.log("list num="+$("#num").val());
		var num=$("#num").val();
		$.ajax({
			type:"get",
			url:"smartanswer/listAnswer.jsp",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				
				//alert(res.length);
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res,function(idx,item){
					s+="<div>"+item.nick+": "+item.content;
					s+="<span class='aday'>"+item.writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-pencil-square amod' idx='"+item.idx+"'></i>";
					s+="<i class='bi bi-trash adel' idx='"+item.idx+"'></i></spna>";
					s+="</div>";
				});
				
				$("div.alist").html(s);
			}
		});
	}
</script>
</head>
<jsp:useBean id="dao" class="data.dao.SmartDao"/>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	dao.updateReadcount(num);
	
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div style="margin: 50px 100px; width: 500px;">
<input type="hidden" id="num" value="<%=dto.getNum()%>">
	<table class="table table-bordered">
		<caption align="top"><b><%=dto.getSubject() %></b></caption>
		
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
				&nbsp;&nbsp;  조회 <%=dto.getReadcount() %>
			</td>
		</tr>
		<tr>
			<td height="150">
				<%=dto.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<b class="acount">댓글<span>0</span></b>
				<div class="alist">
					댓글목록
				</div>
				<div class="aform d-inline-flex">
					<input type="text" id="nickname" class="form-control" style="width: 100px;" placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width: 300px;" placeholder="댓글메세지">
					<button type="button" id="btnsend" class="btn btn-info" style="margin-left: 10px;">저장</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td style="float: right;">
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='index.jsp?main=smartboard/smartForm.jsp'"><i class="bi bi-pen"></i>글쓰기</button>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=smartboard/boardList.jsp'"><i class="bi bi-card-list"></i>목록</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="location.href='index.jsp?main=smartboard/updateForm.jsp?num=<%=num%>&currentPage=<%=currentPage%>'"><i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" class="btn btn-danger btn-sm" onclick="funcdel(<%=num%>,<%=currentPage%>)"><i class="bi bi-trash"></i>삭제</button>
			</td>
		</tr>
	</table>
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
        <input type="text" id="unickname" style="width: 100px;" placeholder="닉네임">
        <input type="text" id="ucontent" style="width: 300px;" placeholder="댓글내용">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="btnUpdate" data-bs-dismiss="modal">수정</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>