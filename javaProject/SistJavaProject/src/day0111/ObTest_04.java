package day0111;

class MyCar{
	
	private String carName;
	private String carColor;
	private int carPrice;
	
	//setter,getter
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarColro() {
		return carColor;
	}
	public void setCarColro(String carColro) {
		this.carColor = carColro;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	
	public void getCarInfo()
	{
		System.out.println("차량명: "+this.carName);
		System.out.println("차량가격: "+this.carPrice);
		System.out.println("차량색상: "+carColor);
	}
	
}

public class ObTest_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyCar car=new MyCar();
		car.setCarName("제네시스");
		car.setCarPrice(5000000);
		car.setCarColro("흰색");
		
		System.out.println("[나의 자동차 정보]");
		car.getCarInfo();
		
		System.out.println("[나의 새차 정보]");
		car.setCarName("그렌저");
		car.setCarPrice(4000000);
		car.setCarColro("검정");
		
		car.getCarInfo();

	}

}
