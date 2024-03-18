package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

///////////////////////////////////////////////////
/*
 * **과일입고목록**
 * 번호  과일명  수량  단가    총금액
 *  1   바나나  10  2000  20000원
 *  2   포도   20  15000
 */
///////////////////////////////////////////////////

public class QuizFileException_15 {
	public static void fruitRead() throws FileNotFoundException,IOException
	{
		String fName="C:\\sist0103\\file\\fruitshop.txt";
		FileReader fr=null;
		BufferedReader br=null;

		fr=new FileReader(fName);
		br=new BufferedReader(fr);

		System.out.println("**과일 입고목록**");
		System.out.println("번호\t과일명\t수량\t단가\t총금액");
		System.out.println("------------------------------------------------------");

		int cnt=0;
		
		while(true)
		{
			String s=br.readLine();

			//종료
			if(s==null)
				break;

			cnt++;

			//문자열 "," 을 기준으로 분리방법 1
			String[] tokens = s.split(",");
			
			//문자열 "," 을 기준으로 분리방법 2
			//StringTokenizer st=new StringTokenizer(s, ",");

			//분리된 문자열을 각각 변수에 저장
			String fruitName = tokens[0];
			int su = Integer.parseInt(tokens[1]);
			int dan = Integer.parseInt(tokens[2]);

			//총금액
			int total = su*dan;

			//결과출력
			System.out.println(cnt+"\t"+tokens[0]+"\t"+tokens[1]+"\t"+tokens[2]+"\t"+total);
		}

		br.close();
		fr.close();
	}



	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			fruitRead();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
