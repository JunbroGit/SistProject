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
	body *{
		font-family: 'gaegu';
	}
</style>
</head>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered">
			<tr>
				<th width="100" class="table-info">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control" style="width: 120px;" required="required">
				</td>
			</tr> 
			<tr>
				<th width="100" class="table-info">제목</th>
				<td>
					<input type="text" name="subject" class="form-control" style="width: 300px;" required="required">
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
					<textarea style="width: 480px; height: 100px;" name="content" class="form-control" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="image" src="../image/logo_img/submit.png" style="width: 60px; height: 60px;">
					<input type="image" src="../image/logo_img/list.png" style="width: 60px; height: 60px;" onclick="location.href='boardList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>