package com.lotte.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/")
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("?12313233213132");
				
		mav.setViewName("index/index");
		return mav;
	}
	
}
