package day0111;

class Artist{
	
	//변수명
	private String enter;
	private String grname;
	private String grsong;
	
	static int cnt=0;
	
	//명시적생성자
	public Artist(String enters,String name,String song)
	{
		this.enter=enters;
		this.grname=name;
		this.grsong=song;
	}
	
	//출력 메서드 한번에 만들기
	public void writegroupData()
	{
		cnt++;
		System.out.println("**아티스트 정보_"+cnt+"**");
		System.out.println("소속기획사: "+this.enter);
		System.out.println("그룹명: "+this.grname);
		System.out.println("대표곡: "+this.grsong);
		System.out.println("=================================");
	}
	
}
/////////////////////////////
public class QuizInstance_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Artist gr1=new Artist("하이브","BTS","버터");
		Artist gr2=new Artist("하이브","NewJeans","어텐션");
		
		gr1.writegroupData();
		gr2.writegroupData();

	}

}
