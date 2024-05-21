<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
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
<style type="text/css">
	img.large{
		width: 450px;
		height: 350px;
	}
</style>
<%
	String shopnum=request.getParameter("shopnum");
	String loginOk=(String)session.getAttribute("loginOk");
	String myId=(String)session.getAttribute("myId");
	
	//아이디에 해당하는 멤버 시퀀스
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myId);
	
	//해당 상품에서만 데이타
	ShopDao sdao=new ShopDao();
	ShopDto dto=sdao.getData(shopnum);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
</head>
<body>
<div style="margin: 50px 100px; width: 700px;">
	<form id="frm">
		<input type="hidden" name="shopnum" value="<%=dto.getShopnum()%>">
		<input type="hidden" name="num" value="<%=num%>">
		
		<table class="table table-bordered">
			<tr>
				<td style="width: 400px;">
					<img src="shopSave/<%=dto.getPhoto()%>" class="large img-thumbnail">
				</td>
				<td>
					<h3>카테고리: <%=dto.getCategory() %></h3>
					<h3>상품명: <%=dto.getSangpum() %></h3>
					<h3>가격: <%=nf.format(dto.getPrice()) %></h3>
					<h3>갯수: 
						<input type="number" min="1" max="10" value="1" step="1" name="cnt">
					</h3>
					<div style="margin-top: 110px; margin-left: 80px;">
						<button type="button" class="btn btn-success" id="btncart">장바구니</button>
						<button type="button" class="btn btn-success" onclick="location.href=' index.jsp?main=shop/shopList.jsp'">상품목록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	$("#btncart").click(function(){
			
		var login="<%=loginOk%>";
			
		if(login=="null"){
			alert("로그인해유");
			return;
		}
			
		var cartdata=$("#frm").serialize();
		//alert(cartdata);
		
		//insert
		$.ajax({
			type:"post",
			dataType:"html",
			data:cartdata,
			url:"shop/detailProcess.jsp",
			success:function(){
				
				//alert("success");
				var a=confirm("장바구니에 넣었어유\n장바구니로 이동하겠어유?");
				
				if(a){
					location.href="index.jsp?main=shop/myCart.jsp";
				}
			}
		});
	});
</script>
</body>
</html>