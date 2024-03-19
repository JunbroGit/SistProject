package day0126;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import orcleDB.DbConnect;

public class QuizStuInfo {

	DbConnect db=new DbConnect();
	
	public void insert()
	{
		Scanner sc=new Scanner(System.in);
		String name,gender,hp;
		int age;
		String sql="";
		
		System.out.println("학생명을 입력하세요");
		name=sc.nextLine();
		System.out.println("성별을 입력하세요");
		gender=sc.nextLine();
		System.out.println("나이를 입력하세요");
		age=Integer.parseInt(sc.nextLine());
		System.out.println("전화번호를 입력하세요");
		hp=sc.nextLine();
		
		sql="insert into stuinfo values(seq_info.nextval,'"+name+"','"+gender+"','"+age+"','"+hp+"',sysdate)";
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			System.out.println("**데이타 추가됨**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void select1()
	{
		System.out.println("S_NO\tS_NAME\tS_GENDER S_AGE\tS_HP\t\tGAIPDAY");
		System.out.println("---------------------------------------------------------------------");
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from stuinfo order by s_no";
		
		conn=db.getOracle();
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int s_no=rs.getInt("s_no");
				String s_name=rs.getString("s_name");
				String s_gender=rs.getString("s_gender");
				int s_age=rs.getInt("s_age");
				String s_hp=rs.getString("s_hp");
				Date gaipday=rs.getDate("gaipday");
				
				System.out.println(s_no+"\t"+s_name+"\t"+s_gender+"\t"+s_age+"\t"+s_hp+"\t"+gaipday);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	public void daelte()
	{
		Scanner sc=new Scanner(System.in);
		int num;
		String sql="";
		
		System.out.println("삭제할 번호입력하시오");
		num=Integer.parseInt(sc.nextLine());
		
		sql="delete from stuinfo where s_no="+num;
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			
			int a=stmt.executeUpdate(sql);
			
			if(a==0)
				System.out.println("없는 데이타 번호입니다");
			else
				System.out.println("**삭제되었습니다**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void update()  
	{
		Scanner sc=new Scanner(System.in);
		String s_no,s_name,s_gender,s_age,s_hp;
		
		System.out.println("수정할 번호를 입력");
		s_no=sc.nextLine();
		
		System.out.println("수정할 이름을 입력해주세요");
		s_name=sc.nextLine();
		System.out.println("수정할 성별을 입력해주세요");
		s_gender=sc.nextLine();
		System.out.println("수정할 나이을 입력해주세요");
		s_age=sc.nextLine();
		System.out.println("수정할 번호을 입력해주세요");
		s_hp=sc.nextLine();
		
		String sql="update stuinfo set s_name='"+s_name+"',s_gender='"+s_gender+"',s_age='"+s_age+"',s_hp='"+s_hp+"'where s_no="+s_no;
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		try {
		stmt=conn.createStatement();
		
		int a=stmt.executeUpdate(sql);
		
		if(a==0)
			System.out.println("수정할 데이타가 존재하지 않습니다");
		else
			System.out.println("데이터가 수정되었습니다");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void select2()
	{
		Scanner sc=new Scanner(System.in);
		String s_name;
		
		System.out.println("검색할 이름을 입력하시오");
		s_name=sc.nextLine();
		
		System.out.println("S_NO\tS_NAME\tS_GENDER S_AGE\tS_HP\t\tGAIPDAY");
		System.out.println("---------------------------------------------------------------------");
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from stuinfo where s_name like '%%"+s_name+"%%'";
		System.out.println(sql);
		
		conn=db.getOracle();
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int s_no=rs.getInt("s_no");
				String name=rs.getString("s_name");
				String s_gender=rs.getString("s_gender");
				int s_age=rs.getInt("s_age");
				String s_hp=rs.getString("s_hp");
				Date gaipday=rs.getDate("gaipday");
				
				System.out.println(s_no+"\t"+name+"\t"+s_gender+"\t"+s_age+"\t"+s_hp+"\t"+gaipday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QuizStuInfo quiz=new QuizStuInfo();
		
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("1.학생정보입력 2.정보출력 3.정보삭제 4.학생정보수정 5.학생검색 9.종료");
			
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				quiz.insert();
			else if(n==2)
				quiz.select1();
			else if(n==3)
				quiz.daelte();
			else if(n==4)
				quiz.update();
			else if(n==5)
				quiz.select2();
			else if(n==9)
			{
				System.out.println("시스템 종료!!");
				break; 
			}
		}
	}

}
