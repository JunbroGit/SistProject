package day0111;

class MyInfo{
	private String name;
	private String mbti;
	private int age;
	
	public MyInfo(String n,String m,int a) {
		name=n;
		mbti=m;
		age=a;
	}
	
	public static void Title()
	{
		System.out.println("이름\tMBTI\t나이");
		System.out.println("========================");
	}
	
	public void Info()
	{
		System.out.println(name+"\t"+mbti+"\t"+age+"세");
	}
	
}

public class QuizArrObTest_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyInfo [] myInfo= {
				new MyInfo("유재석", "INTP", 10),
				new MyInfo("유재석", "INFP", 20),
				new MyInfo("유재석", "ISFP", 30),
		};
		
		MyInfo.Title();
		for(MyInfo info:myInfo)
			info.Info();

	}

}
