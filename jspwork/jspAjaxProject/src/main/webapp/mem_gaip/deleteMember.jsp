<%@page import="java.io.File"%>
<%@page import="mem_gaip.model.MemgaipDao"%>
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
<%
	//num,pass읽기
	String m_num=request.getParameter("m_num");
	String m_pass=request.getParameter("m_pass");
	
	MemgaipDao dao=new MemgaipDao();
	
	boolean b=dao.isEqualPass(m_num, m_pass);
	
	if(b){
		
		//게시글 지우기전 업로드된 이미지 지우기
		String imgName=dao.getData(m_num).getM_photo();
		//업로드 경로
		String uploadPath=getServletContext().getRealPath("/upload");
		
		//파일생성
		File file=new File(uploadPath+"\\"+imgName);
		
		//파일삭제
		if(file.exists()) //파일이 존재하면
			file.delete(); //파일을 삭제
		
		dao.deleteMemgaip(m_num);
		
		response.sendRedirect("memList.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호가 맞지않아유");
			history.back();
		</script>
	<%}
%>
</body>
</html>