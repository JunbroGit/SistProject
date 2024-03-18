package day0110;

import java.util.Scanner;

public class ArraySearchName_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String [] names= {"홍길동","이길동","김길동","하하","노홍철","정형돈","박명수","유재석"};

		boolean flag;
		Scanner sc=new Scanner(System.in);
		String name;
		
		while(true)
		{
			System.out.println("찾을 이름을 입력하세요");
			name=sc.nextLine();
			
			if(name.equalsIgnoreCase("끝"))
			{
				System.out.println("프로그램 종료!!");
				break;
			}
			
			flag=false;
			
			for(int i=0;i<names.length;i++)
			{
				if(name.equals(names[i]))
				{
					flag=true;
					System.out.println(i+1+" 번째에서 검색됨");
				}
			}
			
			if(!flag)
				System.out.println(name+"님은 데이타에 없음");
		}

	}

}
