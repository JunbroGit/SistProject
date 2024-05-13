package spring.mvc.re;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardListController {

	@GetMapping("/")
	public String start() {
		
		return "redirct:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		mview.setViewName("board/boardlist");
		return mview;
	}
}
