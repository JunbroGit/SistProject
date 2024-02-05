package day0111;

class Student1{
	
	private String stuName;
	private String hp;
	private int score;
	
	//생성자 3개짜리
	public Student1(String name,String hp, int score) {
		this.stuName=name;
		this.hp=hp;
		this.score=score;
	}
	
	//출력메서드
	public void writeData()
	{
		System.out.println("이름: "+stuName);
		System.out.println("전화번호: "+hp);
		System.out.println("점수: "+score);
	}
}

public class ArrObTest_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student1 [] stu=new Student1[3];
		
		/*stu[0]=new Student1("유재석", "010-1111-2222", 77);
		stu[1]=new Student1("박명수", "010-3333-4444", 88);
		stu[2]=new Student1("정준하", "010-5555-6666", 99);*/
		
		//생성과 동시에 초기화
		Student1 [] stu1= {
				new Student1("유재석", "010-1111-2222", 77),
				new Student1("박명수", "010-3333-4444", 88),
				new Student1("정준하", "010-5555-6666", 99)
		};
		
		//배열출력(방법#1)
        for(int i=0;i<stu1.length;i++)
        {
        	/*Student1 s=stu[i];
        	s.writeData();*/
        	stu1[i].writeData();
        	System.out.println("-------------------------");
        }
        
        System.out.println("==========================");
        
        //배열출력(방법#2)
        for(Student1 s1:stu1)
        {
        	s1.writeData();
        	System.out.println("-------------------------");
        }

	}

}
