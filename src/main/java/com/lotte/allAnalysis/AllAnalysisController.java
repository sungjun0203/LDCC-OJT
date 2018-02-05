package com.lotte.allAnalysis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/allAnalysis")
public class AllAnalysisController {
	
	@Autowired
	AllAnalysisService allAnalysisService;
	
	
	@RequestMapping("/main")
	public ModelAndView main(Model model) {
		
		model.addAttribute("humanInfo",allAnalysisService.humanInfo());
		model.addAttribute("manSellRank",allAnalysisService.manSellRank());
		model.addAttribute("womanSellRank",allAnalysisService.womanSellRank());
		model.addAttribute("locationSellRank", allAnalysisService.locationSellRank());
		model.addAttribute("fieldSellRank", allAnalysisService.fieldSellRank());
		
		return new ModelAndView("/admin/all_analysis");
	}
	

}
