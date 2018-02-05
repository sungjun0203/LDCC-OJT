package com.lotte.index;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	// 인덱스
	@RequestMapping("/")
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/main");
		
		return mav;
	}
	
	// 인덱스
	@RequestMapping("/admin")
	public ModelAndView adminPage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index/index");
		return mav;
	}
	
}
