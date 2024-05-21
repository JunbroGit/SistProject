package day0105;

import java.util.Scanner;

public class OperTest_10 {

	public static void main(String[] args) {
		// 신체검사를 하는데 이름과 키,몸무게 입력하면
		// 표준몸무게를 출력해보기(키-110)*0.9...표준몸무게는 소수점한자리로 출력해라
		/*
		 * 당신의 이름?
		 * 키?
		 * 몸무게?
		 * 
		 * ===========================
		 * 홍길동님의 표준몸무게는 **.*키로 입니다
		 */
		
		Scanner sc=new Scanner(System.in);
	    
		String name;
		double my_height,my_weight,st_weight;
		
		System.out.print("당신의 이름은?==>");
		name=sc.nextLine();
		System.out.print("당신의 키는?==>");
		my_height=sc.nextDouble();
		System.out.print("당신의 몸무게는?==>");
		my_weight=sc.nextDouble();
		
		st_weight=(my_height-110)*0.9;
		
		System.out.println("===================");
		System.out.printf("%s님의 권장 표준몸무게는%.1f Kg 입니다",name,st_weight);
		

	}

}
