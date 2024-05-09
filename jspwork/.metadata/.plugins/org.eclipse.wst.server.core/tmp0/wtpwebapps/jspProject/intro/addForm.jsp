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
<div style="margin: 30px 50px">
	<form action="addAction.jsp" method="post">
		<table class="table table-bordered" style="width: 600px;">
			<caption align="top"><b>자기소개</b></caption>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required" style="width: 120px;">
				</td>
			</tr>
			
			<tr>
				<th>나이</th>
				<td>
					<input type="number" name="age" class="form-control" value="20" style="width: 80px;">
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="birthday" class="form-control" value="1997-02-20" style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<th>거주지역</th>
				<td>
					<label><input type="radio" name="hometown" value="서울" checked="checked">서울</label>
					<label><input type="radio" name="hometown" value="경기">경기</label>
					<label><input type="radio" name="hometown" value="인천">인천</label>
					<label><input type="radio" name="hometown" value="대전">대전</label>
					<label><input type="radio" name="hometown" value="대구">대구</label>
				</td>
			</tr>
			
			<tr>
				<th>취미</th>
				<td>
					<label><input type="checkbox" name="hobby" value="게임">게임</label>
					<label><input type="checkbox" name="hobby" value="넷플릭스">넷플릭스</label>
					<label><input type="checkbox" name="hobby" value="독서">독서</label>
					<label><input type="checkbox" name="hobby" value="여행">여행</label>
					<label><input type="checkbox" name="hobby" value="공부">공부</label>
				</td>
			</tr>
			
			<tr>
<<<<<<< HEAD
<<<<<<< HEAD
				<th>성격</th>
=======
				<th>하고 싶은 말</th>
>>>>>>> 5d1692f77e6cf40a0a83f743137a408426ce9f3f
=======
				<th>성격</th>
>>>>>>> 2f32182e4b4bad3d0217dd61f4b340ef556cf143
				<td>
					<textarea name="memo" style="width: 500px; height: 100px;" placeholder="자유롭게 서술하세요:)" class="form-control"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">서버로 전송</button>
<<<<<<< HEAD
<<<<<<< HEAD
					<button type="button" class="btn btn-warning" onclick="location.href='introList.jsp'">목록</button>
=======
					<button type="button" class="btn btn-warning" onclick="location.href='infoList.jsp'">목록</button>
>>>>>>> 5d1692f77e6cf40a0a83f743137a408426ce9f3f
=======
					<button type="button" class="btn btn-warning" onclick="location.href='introList.jsp'">목록</button>
>>>>>>> 2f32182e4b4bad3d0217dd61f4b340ef556cf143
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>