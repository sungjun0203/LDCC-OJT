package com.lotte.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.util.FaceApiService;
import com.lotte.util.KakaoApiService;

@Controller
public class MainController {
	// 메인 페이지
	@RequestMapping("/main")
	public String main_intro(HttpSession ses) {
		System.out.println("main_intro page ");
		ses.invalidate();
		return "test2/test21";
	}


}
