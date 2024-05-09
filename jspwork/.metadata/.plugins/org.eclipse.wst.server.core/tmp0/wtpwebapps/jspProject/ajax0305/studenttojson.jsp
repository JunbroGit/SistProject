<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from student order by num";
	
	String s="[";
	
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			int num=rs.getInt("num");
			String name=rs.getString("name");
			String photo=rs.getString("photo");
			int java=rs.getInt("java");
			int spring=rs.getInt("spring");
			
<<<<<<< HEAD
<<<<<<< HEAD
			//num name photo java spring
=======
>>>>>>> 5d1692f77e6cf40a0a83f743137a408426ce9f3f
=======
			//num name photo java spring
>>>>>>> 2f32182e4b4bad3d0217dd61f4b340ef556cf143
			s+="{";
			s+="\"num\":"+num+",\"name\":\""+name+"\",\"photo\":\""+photo+"\",\"java\":"+java+",\"spring\":\""+spring+"\"";
			s+="},";
		}
		
		s=s.substring(0, s.length()-1);
	
	}catch(SQLException e){
		
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
	
	s+="]";
%>

<%=s%>