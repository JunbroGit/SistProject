<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	img.photo{
		width: 200px;
		height: 180px;
		border: 1px solid gray;
		margin-bottom: 10px;
	}
	
	.shoptable{
		padding: 10px;
		height: 150px; 
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("a.goDetail").click(function(){
			
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			
			//디테일 페이지로 이동
			location.href='index.jsp?main=shop/detailPage.jsp?shopnum='+shopnum;
		});
	});
</script>
<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangpums();
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
</head>
<body>
<div class="container">

<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">전체</a></li>
    <li><a data-toggle="tab" href="#menu1">토토로</a></li>
    <li><a data-toggle="tab" href="#menu2">고양이버스</a></li>
    <li><a data-toggle="tab" href="#menu3">메이</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>전체</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 500px;">
      		<tr>
      			<%
      				int i=0;
      				for(ShopDto dto:list){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
      					%>
      						
      					<td>
      						<a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail">
      							<img src="shopSave/<%=dto.getPhoto()%>" class="photo"><br>
      							<%=dto.getSangpum() %>
      						</a><br>
      							<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
      							<span style="float: right;">
      								<div style="color: gray; font-size: 1.1em;">
      									<%
      										int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
      									%>
      									<strike><%=nf.format(price) %></strike>
      								</div>
      								<div style="color: black;">
      									<%=nf.format(dto.getPrice()) %>
      								</div>
      							</span>
      					</td>
      					<%
      						if((i+1)%5==0){%>
      							
      							</tr><tr>
      						<%}
      						i++;
      					%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>토토로</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 200px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("토토로")){
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
      					%>
      					
      					<td>
      						<a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail">
      							<img src="shopSave/<%=dto.getPhoto()%>" class="photo"><br>
      							<%=dto.getSangpum() %>
      						</a><br>
      							<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
      							<span style="float: right;">
      								<div style="color: gray; font-size: 1.1em;">
      									<%
      										int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
      									%>
      									<strike><%=nf.format(price) %></strike>
      								</div>
      								<div style="color: black;">
      									<%=nf.format(dto.getPrice()) %>
      								</div>
      							</span>
      					</td>
      					<%
      						if((i+1)%5==0){%>
      							
      							</tr><tr>
      						<%}
      						i++;
      					}%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>고양이버스</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 200px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("고양이버스")){
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
      					%>
      					
      					<td>
      						<a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail">
      							<img src="shopSave/<%=dto.getPhoto()%>" class="photo"><br>
      							<%=dto.getSangpum() %>
      						</a><br>
      							<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
      							<span style="float: right;">
      								<div style="color: gray; font-size: 1.1em;">
      									<%
      										int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
      									%>
      									<strike><%=nf.format(price) %></strike>
      								</div>
      								<div style="color: black;">
      									<%=nf.format(dto.getPrice()) %>
      								</div>
      							</span>
      					</td>
      					<%
      						if((i+1)%5==0){%>
      							
      							</tr><tr>
      						<%}
      						i++;
      					}%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>메이</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 200px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("메이")){
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
      					%>
      					
      					<td>
      						<a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" class="goDetail">
      							<img src="shopSave/<%=dto.getPhoto()%>" class="photo"><br>
      							<%=dto.getSangpum() %>
      						</a><br>
      							<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
      							<span style="float: right;">
      								<div style="color: gray; font-size: 1.1em;">
      									<%
      										int price=(int)(dto.getPrice()+dto.getPrice()*(sale/100.0));
      									%>
      									<strike><%=nf.format(price) %></strike>
      								</div>
      								<div style="color: black;">
      									<%=nf.format(dto.getPrice()) %>
      								</div>
      							</span>
      					</td>
      					<%
      						if((i+1)%5==0){%>
      							
      							</tr><tr>
      						<%}
      						i++;
      					}%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
  </div>
</div>
</body>
</html>	