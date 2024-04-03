<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
<title>Insert title here</title>
<style type="text/css">
	img.photo{
		width: 130px;
		height: 120px; 
		border: 1px solid gray;
	}
	
	div.sangpum{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("#allCheck").click(function(){
			
			var chk=$(this).is(":checked");
			
			$(".idx").prop("checked",chk);
		});
		
		$("div.sangpum").click(function(){
			
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			
			location.href="index.jsp?main=shop/detailPage.jsp?shopnum="+shopnum;
		});
		
		$("#btncartdel").click(function(){
			
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			if(cnt==0){
				alert("삭제할 상품을 선택해유");
				return;
			}
			
			$(".idx:checked").each(function(i,elt){
				
				var idx=$(this).attr("idx");
				console.log(idx);
				
				//선택한 장바구니 상품 모두 삭제하기
				del(idx);
			});
			
			//현제페이지 새로고침
			location.reload();
		});
		
		$("i.del").click(function(){
			
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var a=confirm("삭제할거에유?");
			if(a){
				del(idx);
				location.reload();
			}
		});
	});
	
	//사용자 함수
	function del(idx){
		
		$.ajax({
			type:"get",
			url:"shop/cartDelete.jsp",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				
			}
		})
	}
</script>
</head>
<%
	String id=(String)session.getAttribute("myId");
	ShopDao dao=new ShopDao();
	List<HashMap<String,String>> list=dao.getCartList(id);
	NumberFormat nf=NumberFormat.getInstance();
%>
<body>
<h4 class="alert alert-success" style="width: 1000px; text-align: center;"><%=id %>님의 장바구니</h4>
<table class="table table-striped" style="width: 1000px;">
	<tr>
		<th style="width: 30px;"><input type="checkbox" id="allCheck"></th>
		<th style="width: 200px;">상품정보</th>
		<th style="width: 200px;">상품금액</th>
	</tr>
	<%
		int totalmoney=0;
		for(int i=0;i<list.size();i++){
			
			HashMap<String,String> map=list.get(i);
			//사진얻기
			String photo=map.get("photo");
			%>
			<tr>
				<td>
					<input type="checkbox" name="idx" class="idx" idx="<%=map.get("idx")%>">
				</td>
				<td>	
					<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
						<img src="shopSave/<%=photo%>" class="photo" align="left" hspace="20">
						<b>상품명: <%=map.get("sangpum") %></b><br>
						<b>수량: <%=map.get("cnt") %></b><br>
						<b>가격: <%=map.get("price") %></b><br>
						<b>날짜: <%=map.get("cartday") %></b>
					</div>
				</td>
				<td style="vertical-align: middle;">
					<%
						int price=Integer.parseInt(map.get("price"));
						int cnt=Integer.parseInt(map.get("cnt"));
						price*=cnt;
						totalmoney+=price;
					%>
					
					<h4>
						<b><%=nf.format(price) %>원</b>
						<i class="bi bi-trash-fill del" idx="<%=map.get("idx") %>" style="color: red; margin-left: 10px;"></i>
					</h4>
					
				</td>
			</tr>
		<%}
	%>
	
	<tr>
		<td colspan="3">
			<button type="button" class="btn btn-danger btn-lg" style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
			
			<span style="font-size: 1.5em; float: right;">총주문금액<b style="color: green;"><%=nf.format(totalmoney) %>원</b></span>
		</td>
	</tr>
</table>
</body>
</html>