package com.lotte.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.util.FaceApiService;
import com.lotte.util.KakaoApiService;
@Controller
@RequestMapping("/main")
public class MainController {
	
	// 메인 페이지
	@RequestMapping("/")
	public ModelAndView index() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("test2/test21");
		return mav;
	}
	
}
