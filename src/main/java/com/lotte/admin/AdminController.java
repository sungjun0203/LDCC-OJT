package com.lotte.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.util.FaceApiService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	FaceApiService faceApiService;
	
	@RequestMapping("/")
	public ModelAndView loginPage() {
		return new ModelAndView("/index/indexTemp");
	}
	
	
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String siginInCheck(AdminDto adminDto) {
		
		//faceApiService.main();
		
		return adminService.adminLoginCheck(adminDto);
	}	
	
	
}
