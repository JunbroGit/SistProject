package orcleDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {

	//url
	static final String ORACLE_DB="jdbc:oracle:thin:@localhost:1521:XE";
	
	//connect메서드
	public Connection getOracle()
	{
		Connection conn=null;
		
		try {
<<<<<<< HEAD
			conn=DriverManager.getConnection(ORACLE_DB, "junbro", "a1234");
=======
			conn=DriverManager.getConnection(ORACLE_DB, "faker", "a1234");
>>>>>>> 717a9e3db25d37c5e102c9c0828bd2a094579ba7
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("로칼 오라클 연결실패!!");
		}
		
		return conn;
	}
	
	//close메서드...총4개
	
	//select만 rs(ResultSet)가 들어간다
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	
	//오버로딩...이름 같은데 다르게 쓰임
	public void dbClose(Statement stmt,Connection conn)
	{
		
			try {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	
	//Prepare Statement 사용2
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	
	//Prepare Statement 사용2
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	

}
