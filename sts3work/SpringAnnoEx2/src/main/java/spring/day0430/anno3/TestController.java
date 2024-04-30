package spring.day0430.anno3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestController {

	@Autowired
	TestDao testdao;
	
	public void insert(String name) {
		
		testdao.insert(name);
	}
	
	public void delete(String num) {
		
		testdao.delete(num);
	}

	public void select(String name) {
		
		testdao.select(name);
	}
}
