package boot.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", "유재석");
		mview.addObject("addr", "서울시 구로구");
		
		mview.setViewName("list");
		
		return mview;
	}
}
