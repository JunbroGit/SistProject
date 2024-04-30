package spring.day0430.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext1.xml");
		
		TestController con=(TestController)app.getBean("textController");
		
		con.insert("유재석");
		con.delete("3");
		con.select("박명수");
	}

}
