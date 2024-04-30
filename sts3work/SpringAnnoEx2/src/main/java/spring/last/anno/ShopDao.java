package spring.last.anno;

public class ShopDao implements ShopDaoInter {

	@Override
	public void insertShop(String sangpum, int price, String color) {
		// TODO Auto-generated method stub

		System.out.println(sangpum+":"+price+":"+color);
	}

	@Override
	public void deleteShop(String num) {
		// TODO Auto-generated method stub

		System.out.println(num+"번 상품을 삭제!!");
	}

	@Override
	public void selectShop(String sangpum, int price, String color) {
		// TODO Auto-generated method stub

	}

}
