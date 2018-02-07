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
	public ModelAndView vending(FaceDto faceDto, Model model,HttpServletRequest request) {
		
		
		HashMap<String,Object> faceResult = new HashMap<String,Object>();
		Integer vendingId =  Integer.parseInt(request.getParameter("vendingNumber"));
		
		model.addAttribute("vendingInfo", vendingService.getVendingMachineInfo(vendingId));
		model.addAttribute("drinksInfo", vendingService.getVmDrinksInfo(vendingId));
		

		faceResult.put("gender", request.getParameter("faceGender"));
		faceResult.put("age", request.getParameter("faceAge"));
		
		String checkHuman = "true";
		
		if(faceResult.get("gender")==null) {
			
			checkHuman = "false";
		}
		
		
		model.addAttribute("checkHuman", checkHuman);
		model.addAttribute("faceResult", faceResult);
		
		return new ModelAndView("user/vending_temp");
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
		
		
		String checkHuman = "true";
		
		HashMap<String,Object> faceResult = faceApiService.faceAnalysis(file);
		Integer vendingId =  Integer.parseInt(request.getParameter("vendingNumber"));
		
		model.addAttribute("vendingInfo", vendingService.getVendingMachineInfo(vendingId));
		model.addAttribute("drinksInfo", vendingService.getVmDrinksInfo(vendingId));
		
		if(faceResult.get("gender")==null) {
			
			checkHuman = "false";
		}
		else {
			
			
			
			HashMap<String,Object> info = new HashMap<String,Object>();
			
			if(faceResult.get("gender").equals("male")) {
				info.put("gender","남" );
			}
			else {
				info.put("gender","여" );
			}
			
			Integer age = 0;
			Double tempAge = Double.parseDouble((String) faceResult.get("age"));
			int intAge = Integer.parseInt(String.valueOf(Math.round(tempAge)));
					
			age =  ( (intAge / 10) * 10);
			
			info.put("age", age);
			info.put("vendingId", vendingId);
			
			System.out.println(info);
			
			model.addAttribute("drinkAnalysis", userService.getDrinkAnalysis(info));
		}
		
		
		model.addAttribute("checkHuman", checkHuman);
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
	
	@ResponseBody
	@RequestMapping("/vendingSubmit")
	public String vendingSubmit(HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> vendingSubmitInfo = new HashMap<String,Object>();
		
		vendingSubmitInfo.put("faceAge",  request.getParameter("faceAge"));
		vendingSubmitInfo.put("faceGender",  request.getParameter("faceGender"));
		vendingSubmitInfo.put("selectDrinkId",  request.getParameter("selectDrinkId"));
		vendingSubmitInfo.put("vendingId",  request.getParameter("vendingId"));
		vendingSubmitInfo.put("stock",  request.getParameter("stock"));
		vendingSubmitInfo.put("sendCheck",  request.getParameter("sendCheck"));
		
		System.out.println(request.getParameter("sendCheck"));
		
		
		userService.vendingSubmit(vendingSubmitInfo);
		
		return "success";
		
	}
	
	@ResponseBody
	@RequestMapping("/vendingStockCheck")
	public HashMap<String,Object> vendingStockCheck(HttpServletRequest request)	{
		
		HashMap<String,Object> vendingSubmitInfo = new HashMap<String,Object>();
		vendingSubmitInfo.put("selectDrinkId",  request.getParameter("selectDrinkId"));
		vendingSubmitInfo.put("vendingId",  request.getParameter("vendingId"));
		
		
		return userService.vendingStockCheck(vendingSubmitInfo);
		
	}
	
	
	
}

