package spring.di.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex4Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("appContext4.xml");
		
		Sungjuk sj=(Sungjuk)app.getBean("sj");
		sj.writeSungjuk();
	}

}
