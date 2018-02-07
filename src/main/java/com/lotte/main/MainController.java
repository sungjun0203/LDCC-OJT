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

import com.lotte.analysis.VendingAnalysisService;
@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired 
	VendingAnalysisService vendingAnalysisService;
	
	// 메인 페이지
	@RequestMapping("/main")
	public ModelAndView index(Model model) throws Exception {
		
		model.addAttribute("vendingCount", vendingAnalysisService.vendingCount());
		model.addAttribute("problemVending", vendingAnalysisService.problemVending());
		model.addAttribute("allSalesInfo", vendingAnalysisService.allSalesInfo());
		
		
		return new ModelAndView("admin/main");
	}
}
