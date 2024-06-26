package day0129;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import orcleDB.DbConnect;

public class QuizJdbc {

	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);
	
	public void insertMember()
	{
		System.out.println("사원명은?");
		String s_name=sc.nextLine();
		System.out.println("부서는?");
		String buseo=sc.nextLine();
		System.out.println("직급은?");
		String position=sc.nextLine();
		System.out.println("성별은?");
		String gender=sc.nextLine();
		System.out.println("월급은?");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("보너스는?");
		int bonus=Integer.parseInt(sc.nextLine());
		
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		String sql="insert into sawonmember values(seq_smem.nextval,?,?,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, s_name);
			pstmt.setString(2, buseo);
			pstmt.setString(3, position);
			pstmt.setString(4, gender);
			pstmt.setInt(5, pay);
			pstmt.setInt(6, bonus);
			
			int n=pstmt.executeUpdate();
			
			if(n==1)
				System.out.println("사원이 저장되었습니다");
			else
				System.out.println("사원이 저장에 실패했습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void writeMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select s_no,s_name,buseo,position,gender,to_char(pay,'L999,999,999')pay,to_char(bonus,'L999,999,999')bonus,ipsaday from sawonmember order by s_no";
		
		System.out.println("\t\t**전체사원정보**");
		System.out.println();
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t\t월급여\t\t\t보너스\t\t입사일");
		System.out.println("--------------------------------------------------------------------------------------------------");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("s_no")+"\t"
						+rs.getString("s_name")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("position")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("pay")+"\t"
						+rs.getString("bonus")+"\t"
						+rs.getDate("ipsaday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	

	public void deleteMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.print("삭제할 번호를 입력하세요 →");
		int s_no=Integer.parseInt(sc.nextLine());
		
		String sql="delete from sawonmember where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, s_no);
			
			int n=pstmt.executeUpdate();
			
			if(n==0)
				System.out.println("존재하지않는 사원입니다");
			else
				System.out.println(s_no+"번 사원정보를 삭제했습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.print("수정할 사원번호를 입력하세요 →");
		int s_no=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 부서를 입력하세요 →");
		String buseo=sc.nextLine();
		System.out.println("수정할 직급를 입력하세요 →");
		String position=sc.nextLine();
		System.out.println("수정할 월급여를 입력하세요 →");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 보너스를 입력하세요 →");
		int bonus=Integer.parseInt(sc.nextLine());
		
		String sql="update sawonmember set buseo=?,position=?,pay=?,bonus=? where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, buseo);
			pstmt.setString(2, position);
			pstmt.setInt(3, pay);
			pstmt.setInt(4, bonus);	
			pstmt.setInt(5, s_no);
			
			int n=pstmt.executeUpdate();
			
			if(n==1)
				System.out.println(s_no+"번 사원이 수정되었습니다");
			else
				System.out.println("존재하지않는 사원입니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void searchMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.print("검색할 사원의 이름을 입력하세요 →");
		String s_name=sc.nextLine();
		
		String sql="select s_no,s_name,buseo,position,gender,to_char(pay,'L999,999,999')pay,to_char(bonus,'L999,999,999')bonus,ipsaday from sawonmember where s_name like ? order by s_no";
		
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t\t월급여\t\t\t보너스\t\t입사일");
		System.out.println("----------------------------------------------------------------------------");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+s_name+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				System.out.println(rs.getInt("s_no")+"\t"
						+rs.getString("s_name")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("position")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("pay")+"\t"
						+rs.getString("bonus")+"\t"
						+rs.getDate("ipsaday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QuizJdbc sawonmember=new QuizJdbc();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("1사원정보입력   2.전체사원출력   3.사원삭제   4.사원수정   5.이름검색   9.시스템종료");
			System.out.print("번호를 선택하세요 →");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				sawonmember.insertMember();
			if(n==2)
				sawonmember.writeMember();
			if(n==3)
				sawonmember.deleteMember();
			if(n==4)
				sawonmember.updateMember();
			if(n==5)
				sawonmember.searchMember();
			else if(n==9)
			{
				System.out.println("시스템을 종료합니다");
				break;
			}
		}
	}

}
