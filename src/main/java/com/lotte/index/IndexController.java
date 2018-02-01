package com.lotte.index;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	// 인덱스 페이지
	@RequestMapping("/")
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index/indexTemp");
		return mav;
	}
	
}
