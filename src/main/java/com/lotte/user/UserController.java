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
import com.lotte.util.KakaoApiService;
import com.lotte.vending.VendingService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	FaceApiService faceApiService;
	
	@Autowired
	VendingService vendingService;
	
	
	
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
	
	
	// 작성자 : 박성준
	// 일반 자판기
	@RequestMapping("/vending")
	public ModelAndView vending(FaceDto faceDto) {
		
		
		System.out.println(faceDto.getGender());
		System.out.println(faceDto.getAge());
		
		return new ModelAndView("user/vending");
	}
	
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
	
	// 작성자 : 박성준
	// 얼굴 인식 자판기
	
	@RequestMapping("/faceVending")
	public ModelAndView vending(@RequestParam("file") MultipartFile file, Model model,HttpServletRequest request) {
		
		HashMap<String,Object> faceResult = faceApiService.faceAnalysis(file);
		Integer vendingId =  Integer.parseInt(request.getParameter("vendingNumber"));
		
		model.addAttribute("vendingInfo", vendingService.getVendingMachineInfo(vendingId));
		model.addAttribute("drinksInfo", vendingService.getVmDrinksInfo(vendingId));
		
		
		model.addAttribute("faceResult", faceResult);
		
		return new ModelAndView("user/vending_temp");
	}
	
	@RequestMapping("/vendingTrouble")
	public ModelAndView vendingTrouble(HttpServletRequest request) throws Exception {
		
		Integer vendingId = Integer.parseInt(request.getParameter("vendingId"));
		
		userService.vendingTrouble(vendingId);
		
		
		return new ModelAndView("/user/main");
		
	}
	
	@ResponseBody
	@RequestMapping("/troubleCheck")
	public Integer troubleCheck(HttpServletRequest request) {
		
		Integer vendingId = Integer.parseInt(request.getParameter("vendingId"));
		
		return userService.vendingErrCnt(vendingId);
	}
	
	@RequestMapping("/vendingSubmit")
	public ModelAndView vendingSubmit(HttpServletRequest request) {
		
		
		System.out.println(request.getParameter("selectDrinkId"));
		System.out.println(request.getParameter("vendingId"));
		
		return new ModelAndView("/user/main");
		
	}
	
	
	
	
	
	
}

