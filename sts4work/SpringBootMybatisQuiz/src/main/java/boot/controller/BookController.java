	package boot.controller;
	
	import java.io.File;
	import java.io.IOException;
	import java.text.SimpleDateFormat;
	import java.util.Date;
	import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.bind.annotation.RequestParam;
	import org.springframework.web.multipart.MultipartFile;
	import org.springframework.web.servlet.ModelAndView;
	
	import boot.data.BookDto;
	import boot.data.BookMapperInter;
	import jakarta.servlet.http.HttpServletRequest;
	
	@Controller
	public class BookController {
	
		@Autowired
		BookMapperInter mapper;
		
		@GetMapping("/")
		public String start() {
			
			return "redirect:book/list";
		}
		
		@GetMapping("/book/list")
		public ModelAndView list() {
			
			ModelAndView mview=new ModelAndView();
			
			//db로부터 총 갯수 얻기
			int totalCount=mapper.getTotalCount();
			
			//리스트
			List<BookDto> list=mapper.getAllDatas();
			
			//저장
			mview.addObject("totalCount", totalCount);
			mview.addObject("list", list);
			
			//포워드
			mview.setViewName("book/booklist");
			
			return mview;
		}
		
		@GetMapping("/book/form")
		public String form() {
			
			return "book/addform";
		}
		
		@PostMapping("/book/insert")
		public String insert(@ModelAttribute BookDto dto,
				@RequestParam MultipartFile upload,
				HttpServletRequest request) {
			
				String path=request.getServletContext().getRealPath("/bookphoto");
				System.out.println(path);
			
			if(upload.getOriginalFilename().equals(""))
				dto.setBookimage(null);
			else {
				SimpleDateFormat sdf=new SimpleDateFormat("MMddHHmmss");
				String photoname=sdf.format(new Date())+upload.getOriginalFilename();
				dto.setBookimage(photoname);
				
				try {
					upload.transferTo(new File(path+"\\"+photoname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//db에 insert
			mapper.insertBook(dto); 
			
			return "redirect:list";
		}
		
	}
