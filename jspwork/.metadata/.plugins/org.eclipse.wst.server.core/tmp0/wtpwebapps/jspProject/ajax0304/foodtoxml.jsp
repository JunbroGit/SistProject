<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from food order by num";
	
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			
			String num=rs.getString("num");
			String foodname=rs.getString("foodname");
			String foodphoto=rs.getString("foodphoto");
<<<<<<< HEAD
<<<<<<< HEAD
			int price=rs.getInt("price");
			int cnt=rs.getInt("cnt");
=======
			String price=rs.getString("price");
			String cnt=rs.getString("cnt");
>>>>>>> 5d1692f77e6cf40a0a83f743137a408426ce9f3f
=======
			int price=rs.getInt("price");
			int cnt=rs.getInt("cnt");
>>>>>>> 2f32182e4b4bad3d0217dd61f4b340ef556cf143
			%>
			
			<food num="<%=num %>">
				<foodname><%=foodname %></foodname>
				<foodphoto><%=foodphoto %></foodphoto>
				<price><%=price %></price>
				<cnt><%=cnt %></cnt>
			</food>
		<%}
		
	}catch(SQLException e){
		
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
%>
</data>