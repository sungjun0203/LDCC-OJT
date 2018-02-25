package com.lotte.fuji;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.phone.FujiUserDto;
import com.lotte.phone.PhoneService;

@Controller
@RequestMapping("/fuji")
public class FujiController {
	
	@Autowired
	PhoneService phoneService;
	
	@RequestMapping("/login")
	public ModelAndView fujiLogin(Model model) {
		
		return new ModelAndView("/fuji/index");
		
	}
	
	@RequestMapping("/main")
	public ModelAndView fujiMain(Model model) {
		
		model.addAttribute("userNmInfo", phoneService.getUserName());
		
		return new ModelAndView("/fuji/main");
	}
	
	@ResponseBody
	@RequestMapping("/phoneAjax")
	public HashMap<String,Object> phoneAjax(HttpServletRequest request){
		
		String userName = request.getParameter("userName");
		
		return phoneService.getUserInfo(userName);
		
		
	}
	
	@RequestMapping("/phoneWrite")
	public String fujiPhoneWrite(Model model, FujiUserDto fujiUserDto) {
		
		phoneService.fujiPhoneWrite(fujiUserDto);
		
		return "redirect:/fuji/phoneList";
	}
	
	
	@RequestMapping("/phoneList")
	public ModelAndView fujiPhoneList(Model model) {
		
		return new ModelAndView("/fuji/phoneList");
	}
	
	
}
