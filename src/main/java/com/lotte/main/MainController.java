package com.lotte.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		return new ModelAndView("admin/main");
	}
	
	
}
