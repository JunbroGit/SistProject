package day0105;

public class OperTest_03 {

	public static void main(String[] args) {
		// 증감연산자 ++,--
		
		int a,b;
		a=b=5;
		
		//단항일경우에는 증감연산자를 앞에 붙히나 뒤에 붙히나 같다
		++a;
		b++;
		
		System.out.println("a="+a+", b="+b);
		
		//수식에서는 전치,후치가 결과값이 틀리다
		int m,n;
		m=n=0;
		a=b=5;
		
		m=a++; //후치일경우 먼저 대입후 증가
		System.out.println("m="+m+", a="+a);
		
		n=++b; //전치일경우 먼저 증가후 대입
		System.out.println("n="+n+", b="+b);

	}

}
