package day0112;

class Food{
	
	private String foodName;
	private int fPrice;
	
	static int no;
	
	//명시적생성자(2개)
	public Food(String fn, int fp) {
		this.foodName=fn;
		this.fPrice=fp;
	}
	
	
	//출력문
	public void FoodData(){
		no++;
		System.out.println("[음식_"+no+"]");
		System.out.println("음식명: "+this.foodName);
		System.out.println("음식가격: "+this.fPrice);
	}
	
}

public class ArrReview_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*Food f1=new Food("비빔밥", 10000);
		Food f2=new Food("김치찌개", 8000);
		
		f1.FoodData();
		f2.FoodData();*/
		
		Food [] food = new Food[3];
		
		food[0]=new Food("비빔밥", 10000);
		food[1]=new Food("김치찌개", 8000);
		food[2]=new Food("된장찌개", 8000);
		
		for(int i=0;i<food.length;i++) {
			/*Food f=food[i];
			f.getFood();
			
			food[i].FoodData();*/
		}
		
		for(Food f:food) {
			f.FoodData();

	}

}
}
