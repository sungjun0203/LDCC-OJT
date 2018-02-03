package com.lotte.test;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.analysis.VendingAnalysisService;
import com.lotte.util.FaceApiService;
import com.lotte.util.KakaoApiService;
@Controller
@RequestMapping("/test12")
public class TestController {
	
	@Autowired
	KakaoApiService kakaoApiService;
	
	@Autowired
	FaceApiService faceApiService;
	
	@Autowired
	VendingAnalysisService vendingAnalysisService;
	
	@RequestMapping("/")
	public ModelAndView index(@RequestParam("file") MultipartFile file) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String,Object> faceValue = faceApiService.faceAnalysis(file);
		
		String age = (String) faceValue.get("age");
		String gender = (String) faceValue.get("gender");
		
		//KakaoApiService.sendMesageAPI("http://210.93.181.229:9090/v1/send/kakao-friend", "01031518902", "Y2xhc3M6c2VjcmV0MTIhQA==", "d6b73318d4927aa80df1022e07fecf06c55b44bf", "당신의 나이는 : " + age + " 당신의 성별은 : " + gender);
				
		mav.setViewName("test/fileUpload");
		return mav;
	}
	
	@RequestMapping("/analysis")
	public ModelAndView analysis(Model model) {
		
		model.addAttribute("vendingCount", vendingAnalysisService.VendingCount());
		
		return new ModelAndView("test/fileUpload");
	}
	
}
