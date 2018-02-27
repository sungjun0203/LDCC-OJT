package com.lotte.fuji;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.admin.AdminDto;
import com.lotte.phone.FujiUserDto;
import com.lotte.phone.PhoneService;

@Controller
@RequestMapping("/fuji")
public class FujiController {

	@Autowired
	PhoneService phoneService;
	
	@Autowired
	FujiService fujiService;

	// 로그인 체크
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String siginInCheck(HttpSession session, AdminDto adminDto) {
		return fujiService.adminLoginCheck(session, adminDto);
	}

	@RequestMapping("/login")
	public ModelAndView fujiLogin(Model model) {

		return new ModelAndView("/fuji/index");

	}

	@RequestMapping("/main")
	public ModelAndView fujiMain(Model model) {

		return new ModelAndView("/fuji/main");

	}

	@RequestMapping("/phoneWrite")
	public ModelAndView fujiPhoneWrite(Model model) {

		model.addAttribute("userNmInfo", phoneService.getUserName());

		return new ModelAndView("/fuji/phoneWrite");
	}

	@ResponseBody
	@RequestMapping("/phoneAjax")
	public HashMap<String, Object> phoneAjax(HttpServletRequest request) {

		String userName = request.getParameter("userName");
		return phoneService.getUserInfo(userName);

	}

	@RequestMapping("/phoneWriteSubmit")
	public String fujiPhoneWrite(Model model, FujiUserDto fujiUserDto) {

		phoneService.fujiPhoneWrite(fujiUserDto);

		return "redirect:/fuji/phoneList";
	}

	@RequestMapping("/phoneList")
	public ModelAndView fujiPhoneList(Model model) {

		model.addAttribute("fujiInfoList", phoneService.getInfoList());

		return new ModelAndView("/fuji/phoneList");
	}

	@ResponseBody
	@RequestMapping("/phoneDateList")
	public ArrayList<FujiUserDto> phoneDateList(HttpServletRequest request) throws ParseException {

		String wantDate = request.getParameter("wantDate");

		return phoneService.getPhoneDateList(wantDate);

	}

	@ResponseBody
	@RequestMapping("/phoneSearchList")
	public ArrayList<FujiUserDto> phoneSearchList(HttpServletRequest request) throws ParseException {

		String searchData = request.getParameter("searchData");

		return phoneService.getPhoneSearchList(searchData);

	}
	
	@ResponseBody
	@RequestMapping("/infoDelete")
	public Integer infoDelete(HttpServletRequest request) {
		
		Integer infoId = Integer.parseInt(request.getParameter("infoId"));
		phoneService.infoDelete(infoId);
		
		return 1;
		
	}
	
	@RequestMapping("/userList")
	public ModelAndView userList(Model model) {
		
		model.addAttribute("allUserList", phoneService.allUserList());		
		return new ModelAndView("/fuji/userList");
	}

}
