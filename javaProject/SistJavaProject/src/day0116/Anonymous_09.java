package day0116;

abstract class AbstObj{
	
	abstract public void dataIn();
	abstract public void dataout();
}
///////////////////////////////////////
class SubAbst extends AbstObj{

	@Override
	public void dataIn() {
		// TODO Auto-generated method stub
		System.out.println("상속_데이타입력");
	}

	@Override
	public void dataout() {
		// TODO Auto-generated method stub
		System.out.println("상속_데이타출력");
	}
	
}
///////////////////////////////////////
public class Anonymous_09 {

	//익명내부클래스
	AbstObj ab1=new AbstObj() {
		
		@Override
		public void dataout() {
			// TODO Auto-generated method stub
			System.out.println("익명내부클래스_데이타출력");
		}
		
		@Override
		public void dataIn() {
			// TODO Auto-generated method stub
			System.out.println("익명내부클래스_데이타입력");
		}
	};
	
	SubAbst sub=new SubAbst();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Anonymous_09 an=new Anonymous_09();
		
		//익명내부클래스
		an.ab1.dataIn();
		an.ab1.dataout();
		
		//상속받은클래스
		/*SubAbst sub=new SubAbst();
		sub.dataIn();
		sub.dataout();*/
		an.sub.dataIn();
		an.sub.dataout();
	}

}
