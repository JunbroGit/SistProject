package day0111;

class Shop{
	private String sangpum;
	private int price;
	private String sangColor;
	
	public Shop(String s,int p,String c) {
		sangpum=s;
		price=p;
		sangColor=c;
	}
	
	//제목
	public static void showTitle()
	{
		System.out.println("상품명\t가격\t색상");
		System.out.println("====================");
	}
	//생성한 갯수만큼 출력
	public void showShop()
	{
		System.out.println(sangpum+"\t"+price+"\t"+sangColor);
	}
}

public class ArrObTest_11 {

	public static void main(String[] args) {
		// 4개 생성해서 출력할것
		Shop [] shop=new Shop[4]; //null로 초기화 주소값 할당
		//shop[0].showShop();
		
		/*Shop [] s1= {
				new Shop("아이폰", 20000, "퍼플"),
				new Shop("에어팟", 5000, "화이트"),
				new Shop("맥북", 100000, "스페이스 그레이"),
				new Shop("아이패드", 30000, "실버")
		};
		
		for(int i=0;i<s1.length;i++)
		{
			s1[i].showShop();
			System.out.println("---------------------------------");
		}
		
		System.out.println("==========================================");
		
		for(Shop sh:s1)
		{
			sh.showShop();
			System.out.println("---------------------------------");
		}*/
		
		//4개의 shop배열에 생상자를 통해서 생성
		shop[0]=new Shop("아이폰", 20000, "퍼플");
		shop[1]=new Shop("에어팟", 5000, "화이트");
		shop[2]=new Shop("맥북", 100000, "스페이스 그레이");
		shop[3]=new Shop("아이패드", 30000, "실버");
		
		//출력
		Shop.showTitle();
		for(Shop s:shop)
			s.showShop();
		System.out.println();
		

	}

}
