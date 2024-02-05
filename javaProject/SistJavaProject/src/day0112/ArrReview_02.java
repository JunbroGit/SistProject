package day0112;

class Shop{
	
	private String sangName;
	private int sangPrice;
	private String sangCorlor;
	
	static int no;
	
	public Shop(String sn,int sp,String sc) {
		this.sangName=sn;
		this.sangPrice=sp;
		this.sangCorlor=sc;
	}
	
	public void ShopData() {
		System.out.println("["+sangName+"매장 입고상품]");
		System.out.println();
		System.out.println("번호\t상품명\t가격\t색상");
		System.out.println("==============================================");
	}
	
	//출력
	public void ShopSangPum() {
		no++;
		System.out.println(no+"\t"+sangName+"\t"+sangPrice+"\t"+sangCorlor);
	}
	
	
}

public class ArrReview_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Shop [] shop= {
			new Shop("요가매트", 25000, "분홍")
		};
		

	}

}
