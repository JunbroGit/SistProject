package day0105;

import java.util.Calendar;
import java.util.Scanner;

public class QuizMyAgeInOut_02 {

	public static void main(String[] args) {
		/*
		 * 당신의 이름은?==>홍길동
		 * 당신이 태어난 연도는?==>2000
		 * 당신이 사는 지역은?==>조선
		 * 
		 * =============================
		 * [홍길동 님의 개인정보]
		 * =============================
		 * 이름: 홍길동
		 * 태어난년도: 2000
		 * 나이: **세
		 * 지역: 조선
		 * 
		 */
		
        //1.import
		Scanner sc=new Scanner(System.in);
		Calendar cal=Calendar.getInstance();
		
		//2.변수선언
		String name,city;
		int curYear,myYear,myAge;
		
		//3.입력
		System.out.print("당산의 이름은?==>");
		name=sc.nextLine();
		System.out.print("당신이 태어난 연도는?==>");
		//myYear=sc.nextInt();
		myYear=Integer.parseInt(sc.nextLine());
		//Integer.parseInt("1988")=1980  : String->int
		//sc.nextLine() 는 키보드의 버퍼나 엔터를 먼저 읽어서 없애준다
		System.out.print("당신이 사는 지역은?==>");
		city=sc.nextLine();
		
		//4.계산
		curYear=cal.get(cal.YEAR); //2024
		myAge=curYear-myYear;
		
		//4.출력
		System.out.println("====================");
		System.out.println("\t[홍길동 님의 개인정보]");
		System.out.println("====================");
		System.out.println("이름: "+name);
		System.out.println("태어난 연도: "+myYear+" 년생");
		System.out.println("나이: "+myAge+" 세");
		System.out.println("사는지역: "+city);
		
		
		
		
	}

}
