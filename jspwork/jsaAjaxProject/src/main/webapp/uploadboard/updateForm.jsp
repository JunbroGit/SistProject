<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#preshow{
		position: absolute;
		left: 650px;
		top: 100px;
	}
</style>
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
    	
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        
        reader.onload = function (e) {
        	
        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            $('#preshow').attr('src', e.target.result);
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
            //(아래 코드에서 읽어들인 dataURL형식)
        }                   
        reader.readAsDataURL(input.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    }
}
</script>
</head>
<%
	String num=request.getParameter("num");
	UploadBoardDao dao=new UploadBoardDao();
	UploadBoardDto dto=dao.getData(num);
%>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="updateAction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<tr>
				<th width="100" class="table-info">작성자</th>
				<td>
					<b><%=dto.getWriter() %></b>
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">제목</th>
				<td>
					<input type="text" name="subject" class="form-control" style="width: 300px;" required="required" value="<%=dto.getSubject()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">사진업로드</th>
				<td>
					<input type="file" name="photo" class="form-control" style="width: 300px;" required="required" onchange="readURL(this)">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">비밀번호</th>
				<td>
					<input type="text" name="pass" class="form-control" style="width: 200px;" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;" name="content" class="form-control" required="required"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="num" value="<%=num%>">
					<button type="submit" style="width: 100px;" class="btn btn-success btn-md">수정하기</button>
					<button type="button" style="width: 100px;" class="btn btn-warning btn-md" onclick="location.href='boardList.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
	
	<img src="../save/<%=dto.getImgname() %>" id="preshow">
</div>
</body>
</html>