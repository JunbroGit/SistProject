<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="mem_gaip.model.MemgaipDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String realPath=getServletContext().getRealPath("/upload");
	
	int uploadSize=1024*1024*5;
	
	try{
	MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	String m_num=multi.getParameter("m_num");
	String m_pass=multi.getParameter("m_pass");
	String m_id=multi.getParameter("m_id");
	String m_hp=multi.getParameter("m_hp");
	String m_name=multi.getParameter("m_name");
	String m_photo=multi.getFilesystemName("m_photo");

	MemgaipDto dto=new MemgaipDto();
	
	dto.setM_num(m_num);
	dto.setM_pass(m_pass);
	dto.setM_id(m_id);
	dto.setM_hp(m_hp);
	dto.setM_name(m_name);
	dto.setM_photo("upload/"+m_photo);
	
	MemgaipDao dao=new MemgaipDao();
	
	boolean b=dao.isEqualPass(m_num, m_pass);
	
	if(b){
		
		dao.updateMemgaip(dto);
		
		response.sendRedirect("memList.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸어유");
			history.back();
		</script>
	<%}
	
	}catch(Exception e){
		
	}
%>
</body>
</html>