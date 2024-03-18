package day0116;

import java.util.Scanner;

class SawonOuter{
	
	private String sawonName;
	private int gibonPay,familysu,timesu;
	
	public void process()
	{
		//데이타 입력
		InputInner input=new InputInner();
		input.inputData();
		//결과 출력
		SudangInner output=new SudangInner();
		output.writeSawonData();
	}
	
	class InputInner{
		
		public void inputData()
		{
			Scanner sc=new Scanner(System.in);
			System.out.println("사원명 입력");
			sawonName=sc.nextLine();
			System.out.println("기본급?");
			gibonPay=sc.nextInt();
			System.out.println("초과시간은?");
			timesu=sc.nextInt();
			System.out.println("가족수는?");
			familysu=sc.nextInt();
		}
	}
	
	class SudangInner{
		
		public int getTimeSudang()
		{
			return timesu*30000;
		}
		
		public int getFamilySudang()
		{
			if(familysu<=4)
				return 200000;
			else
				return 300000;
		}
		
		public int getTex()
		{
			return (int)(gibonPay*0.03);
		}
		
		public int getTotalPay()
		{
			return gibonPay+getFamilySudang()+getTimeSudang()-getTex();
		}
		
		public void writeSawonData()
		{
			System.out.println("사원명\t기본급\t초과근무시간\t가족수\t시간수당\t가족수당\t세금\t총급여");
			System.out.println(sawonName+"\t"+gibonPay+"\t"+timesu+"\t"+familysu+"\t"+getTimeSudang()+"\t"+getFamilySudang()+"\t"+getTex()+"\t"+getTotalPay());
		}
	}
}

public class QuizInnerClass_10 {

	public static void main(String[] args) {
		//방법1:
		/*SawonOuter sawon=new SawonOuter();
		
		SawonOuter.InputInner input=sawon.new InputInner();
		input.inputData();
		
		SawonOuter.SudangInner output=sawon.new SudangInner();
		output.writeSawonData();*/
		
		//방법1
		SawonOuter sawon = new SawonOuter();
        sawon.process();
		
	}

}
