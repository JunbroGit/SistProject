package day0105;

import java.util.Scanner;

public class QuizOper_21 {

	public static void main(String[] args) {
		/*
		 * 평가는 (90점 이상 참잘함!! 80점 이상은 좀더 노력하세요~~ 80점미만: 불합격)
		 * 이름을 입력하세요
		 * 손흥민
		 * 국,영,수 점수를 입력하세요
		 * 88
		 * 99
		 * 77
		 * 
		 * =======================
		 * [손흥민 님의 기말고사 성적]
		 * 총점: ** 점
		 * 평균: **.* 점
		 * 평가: 좀더 노력하세요~~
		 */
		
		Scanner sc=new Scanner(System.in);
		
		String name,p_msg;
		int K,E,M,score,tot;
		double avg;
		
		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("국,영,수 점수를 입력하세요");
		K=sc.nextInt();
		E=sc.nextInt();
		M=sc.nextInt();
		
		tot=K+E+M;
		avg=tot/3.0;
		p_msg=avg>=90?"참잘함!!":avg>=80?"좀 더 노력하세요~~":"불합격";
		
		System.out.println("=============================");
		System.out.println(name+"님의 기막고사 성적");
		System.out.println("총점: "+tot+" 점");
		System.out.printf("평균: %.1f 점\n", avg);
		System.out.println("평가: "+p_msg);
		
		

	}

}
