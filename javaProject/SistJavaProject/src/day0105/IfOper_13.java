package day0105;

public class IfOper_13 {

	public static void main(String[] args) {
		//if문과 삼항연산자 비교
		
		int score=50;
		char grade; //학점
		
		/*if(score>=90)
			grade='A';
		else if(score>=80)
			grade='B';
		else if(score>=70)
			grade='C';
		else if(score>=60)
			grade='D';
		else
			grade='F';*/
		
		//삼항연산자
		/*grade=score>=90?'A':
			score>=80?'B':
			score>=70?'C':
			score>=60?'B':'F';*/
		
		//switch
		switch(score/10)
		{
		case 10:case 9:
			grade='A';
			break;
		case 8:
			grade='B';
		case 7:
			grade='C';
		case 6:
			grade='D';
		default:
			grade='F';
		
		
		}
			
		System.out.println("학점은 "+grade+"입니다");

	}

}
