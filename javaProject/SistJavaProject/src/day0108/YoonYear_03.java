package day0108;

import java.util.Scanner;

public class YoonYear_03 {

	public static void main(String[] args) {
		//1.연도를 4로 나누어 나머지가 0 이고
		//2.연도를 100으로 나누어 나머지가 0이 아니거나
		//3.연도를 400으로 나누어 나머지가 0이면 = "윤년"
		//4.그 외 나머지 = "평년"
		
		Scanner sc=new Scanner(System.in);
		int year;
		
		System.out.println("입력연도");
		year=sc.nextInt();
		
		if(year%4==0&&year%100!=0||year%400==0)
			System.out.println("윤년");
		else
			System.out.println("평년");

	}

}
