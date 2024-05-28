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
<style type="text/css">
	#showimg{
	  width: 130px;
	  height: 160px;
	  border: 1px solid gray;
	}
</style>
<script type="text/javascript">
$(function(){
	
	//버튼클릭시 사진불러오는 이벤트
	$("#btnphoto").click(function(){
		$("#myphoto").trigger("click");
	})
	
	//사진을 불러오면 미리보기 하기
	$("#myphoto").change(function(){
		if($(this)[0].files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$("#showimg").attr('src',e.target.result);
			}
			reader.readAsDataURL($(this)[0].files[0]);
		}
	})
	
	//중복체크 버튼클릭시 아이디 체크
	$("#btnidcheck").click(function(){
		//var id=$("#loginid").val();
		//alert(id);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"idcheck",
			data:{"id":$("#loginid").val()},
			success:function(res){
				if(res.count==0){
					//alert("가입가능");
					$("span.idsuccess").text("ok");
				}else{
					//alert("이미 가입된아이디 다시 입력");
					$("span.idsuccess").text("fail");
					$("#loginid").val("");
				}
			}
		})
	});
	
	//아이디 입력시 idsuccess값 지우기
	$("#loginid").keydown(function(){
		$("span.idsuccess").text("");
	})
	
	//2번째 비밀번호 입력시 체크
	$("#pass2").keyup(function(){
		var p1=$("#pass").val();
		var p2=$(this).val();
		
		if(p1==p2)
			$("span.passsuccess").text("ok");
		else
			$("span.passsuccess").text("fail");
	})
	
	//submit전에 호출
	function check(){
		//사진
		if($("#myphoto").val()==''){
			alert("사진을 넣어주세요");
			return false;
		}
		//중복체크
		if($("span.idsuccess").text()!='ok'){
			alert("중복체크 해주세요");
			return false;
		}
		
		//비밀번호
		if($("spna.passsuccess").text()!='ok'){
			alert("비밀번호가 서로 다릅니다");
			return false;
		}
	}
})
</script>
</head>
<body>
<div style="margin: 20px 30px;">
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<td style="width: 250px;" align="center" rowspan="4">
					<input type="file" name="myphoto" id="myphoto" style="display: none;">
					<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
					<br>
					<img id="showimg" src="">
				</td>
				<td>
					<div class="d-inline-flex">
						<input type="text" placeholder="아이디 입력" name="id" id="loginid" class="form-control" style="width: 120px;" required="required">
						<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">중복체크</button>
						&nbsp;
						<span class="idsuccess" style="width: 60px; color: green;"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="d-inline-flex">
						<input type="password" style="width: 120px;" name="pass" id="pass" class="form-control" required="required" placeholder="숫자 4자리">
						<input type="password" style="width: 120px;" id="pass2" class="form-control" required="required" placeholder="비밀번호 확인">
						&nbsp;
						<span class="passsuccess" style="width: 60px; color: green;"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="name" class="form-control" style="width: 150px;" placeholder="이름 입력">
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" name="email" class="form-control" style="width: 240px;" placeholder="이메일 입력">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="d-inline-flex">
						<input type="text" name="hp" class="form-control" style="width: 200px;" placeholder="숫자만 입력">
						<input type="text" name="addr" class="form-control" style="width: 300px;" placeholder="주소 입력">
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 200px;">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>