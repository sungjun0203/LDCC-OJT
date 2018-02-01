package com.lotte.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// 로그인 체크
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String siginInCheck(HttpSession session, AdminDto adminDto) {
		return adminService.adminLoginCheck(session,adminDto);
	}	
	
	
}
