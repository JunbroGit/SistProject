<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.mainimg{ 
		width: 120px;
		height: 160px;
		border: 1px solid gray;
	}
	
	.mainimg:hover{
		cursor: pointer;
		width: 200px;
		height: 260px;
		border: 5px inset green;
	}
</style>
</head>
<body>
	<%
	List<String> list = new ArrayList();
	list.add("yellow");
	list.add("gray");
	list.add("blue");
	list.add("green");
	list.add("orange");
	list.add("red");
	
	for(String a:list){%>

	<div style="width: 100px; height: 50px; background-color: <%=a%>"><%=a %></div>
	<%}
%>

	<h3>이미지 배열로 출력</h3>

	<%
	 String [] imgArr={"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"};
	
	int n=0;
	%>

    <table>
        <%
        for(int i=0;i<3;i++)
        {
        %>
        <tr>
            <%
        for(int j=0;j<3;j++)
                {%>
                <td>
                    <img src="../image/음식이미지/<%=imgArr[n] %>" width="50px" height="50px">
                </td>
                <%
                n++;
            }
          %>
        </tr>
        <%
          }
        %>
    </table>
    
    <h2>문제: 연예인사진 20개를 4행5열로</h2>
    <table>
      <%
      int a=0;
      
      for(int row=1;row<=4;row++)
      {%>
    	  <tr>
    	  	<%
    	  	for(int col=1;col<=5;col++)
    	  	{
    	  		a++;
    	  		%>
    	  		<td>
    	  		  <img src="../image/연예인이미지/<%=a%>.jpg" class="mainimg">
    	  		</td>
    	  	<%}
    	  	%>
    	  </tr> 
    	  
      <%}
      %>
    </table>
</body>
</html>