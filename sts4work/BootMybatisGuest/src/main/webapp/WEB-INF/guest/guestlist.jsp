<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("i.photo").click(function(){
			$("#photos").trigger("click");
		})
		
		$("#btnsave").click(function(){
			if($("#nick").val()==''){
				alert("닉네임 입력바람");
				return;
			}
			if($("#pass").val()==''){
				alert("비밀번호 입력바람");
				return;
			}
			if($("#content").val()==''){
				alert("내용 입력바람");
				return;
			}
			
			//데이타 전송
			var s=$("#frm").serialize();
			
			//insert ajax
			$.ajax({
				type:"post",
				url:"insert",
				data:s,
				dataType:"json",
				success:function(res){
					alert(res.msg);
					
					location.reload();
					
					$("#nick").val('');
					$("#pass").val('');
					$("#content").val('');
				}
			})
		})
		
		$("#photos").change(function(){
			var fdata=new FormData();
			var inputFile=$("#photos");
			var files=inputFile[0].files;
			
			if(files.length==0)
				return false;
			
			for(var i=0;i<files.length;i++){
				console.log(i);
				fdata.append("photos",files[i]);
			}
			
			$.ajax({
				url:"upload",
				processData:false, /* 서버전달 데이타는 query String 이라는 형태로 전달된다, 파일전송의 경우는 이를 하지않아야함 */
				contentType:false, /* enctype이 원래 기본설정이 application/x.www 이거인데 multipart/form-data 로 변경하는것이 false */
				type:"post",
				data:fdata,
				dataType:"json",
				success:function(res){
					console.log("파일명들 확인: "+res.photoname);
				}
			})
		})
	})
</script>
</head>
<body>
<div align="center">
	<h4>사진들을 등록하세요
	<input type="file" name="photos" id="photos" multiple="multiple" style="display: none;">
	&nbsp;&nbsp;
	<i class="bi bi-camera2 photo" style="font-size: 30px;"></i></h4>
	
	<form id="frm">
		<table class="table table-bordered" style="width: 700px;">
			<tr>
				<th width="100">닉네임</th>
				<td>
					<input type="text" class="form-control input-sm" style="width: 100px;" id="nick" name="nick">
				</td>
				<th width="100">비밀번호</th>
				<td>
					<input type="password" class="form-control input-sm" style="width: 100px;" id="pass" name="pass">
				</td>
			</tr>
			<tr>
				<td colspan="4">
				<div class="d-inline-flex">
					<textarea style="width: 550px; height: 100px;" class="form-control" id="content" name="content"></textarea>
					<button type="button" class="btn btn-info" style="margin-left: 10px; width: 100px; height: 100px;" id="btnsave">저장</button>
				</div>
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
	
	<c:forEach var="a" items="${list }">
		<table class="table table-bordered" style="width: 700px;">
			<tr>
				<td>
					<b>${a.nick }</b>
					<span style="float: right; color: gray;">작성일: <fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd"/></span>
				</td>
			</tr>
			<tr>
				<td>	
					<c:if test="${a.photo!='no' }">
						<c:forTokens var="imp" items="${a.photo }" delims=",">
							<a href="../guestphoto/${imp }">
								<img alt="" src="../guestphoto/${imp }" style="width: 100px; height: 100px; border: 1px solid green; border-radius: 20px;">
							</a>
						</c:forTokens>
					</c:if>
					
					<pre>
						<h6>${a.content }</h6>
					</pre>
					
					<hr>
					
					<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href=''">삭제</button>
				</td>
			</tr>
		</table>
	</c:forEach>
</div>
</body>
</html>