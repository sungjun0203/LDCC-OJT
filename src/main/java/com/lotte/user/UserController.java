package com.lotte.user;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.util.CommonService;
import com.lotte.util.FaceApiService;
import com.lotte.util.FaceDto;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	FaceApiService faceApiService;
	
	@RequestMapping("/")
	public ModelAndView index() {
		
		return new ModelAndView("user/main");	
	}
	
	@RequestMapping("/login")
	public ModelAndView loginPage(){
		
		return new ModelAndView("user/login");
	}
	
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request) {
		
		return userService.userLoginCheck(request);
		
	}
	
	@RequestMapping("/input")
	public ModelAndView inputPage(Model model){
		
		ArrayList<HashMap<String,Object>> location = commonService.getVendingAllLocation();
		
		model.addAttribute("location", location);
		
		return new ModelAndView("user/input");
	}
	
//	@RequestMapping("/vending")
//	public ModelAndView vending(FaceDto faceDto) {
//		
//		
//		System.out.println(faceDto.getGender());
//		System.out.println(faceDto.getAge());
//		
//		return new ModelAndView("user/vending");
//	}
	
	@ResponseBody
	@RequestMapping("/vendingId")
	public ArrayList<Integer> vendingId(HttpServletRequest request){
		
		String location = request.getParameter("location");
		
		return commonService.getVendingId(location);
		
	}
	
	@RequestMapping("/faceAnalysis")
	public ModelAndView faceAnalysis(Model model) {
		
		
		ArrayList<HashMap<String,Object>> location = commonService.getVendingAllLocation();
		
		model.addAttribute("location", location);
		return new ModelAndView("/user/input_photo");
	}
	
	
	
	@RequestMapping("/faceVending")
	public ModelAndView vending(@RequestParam("file") MultipartFile file, Model model) {
		
		HashMap<String,Object> faceResult = faceApiService.faceAnalysis(file);
		
		return new ModelAndView("user/vending");
	}
	
	
	
	
	
}

