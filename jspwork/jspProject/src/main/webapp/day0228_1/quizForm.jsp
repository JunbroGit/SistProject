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
</head>
<body>
	<form action="quizWrite.jsp" method="post">
		<table class="table table-bordered" style="width: 500px">
			<tr>
				<th class="table-info">사원명</th>
				<td>
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
		
			<tr>
				<th width="100" class="table-info">입사일자</th>
				<td>
					<input type="date" name="ipsaday" class="form-control">
				</td>
			</tr>
		
			<tr>
				<th width="100" class="table-info">점심메뉴</th>
				<td>
					<label>
						<input type="radio" name="lunch" value="../image/음식이미지/1.jpg"><img src="../image/음식이미지/1.jpg" width="100">
						<input type="radio" name="lunch" value="../image/음식이미지/2.jpg"><img src="../image/음식이미지/2.jpg" width="100">
						<input type="radio" name="lunch" value="../image/음식이미지/3.jpg"><img src="../image/음식이미지/3.jpg" width="100">
					</label>
				</td>
			</tr>
		
			<tr>
				<th width="100" class="table-info">건의 메뉴</th>
				<td>
					<select name="wtfood" class="form-control" multiple="multiple">
						<option value="스튜">스튜</option>
						<option value="콘치즈">콘치즈</option>
						<option value="볶음밥">볶음밥</option>
						<option value="솥밥">솥밥</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-success" style="width: 100px" value="전송">
					<input type="reset" class="btn btn-warning" style="width: 100px" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>