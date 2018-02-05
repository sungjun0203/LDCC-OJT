package com.lotte.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;

	// 메인 페이지
	@RequestMapping("/list")
	public ModelAndView index(Model model) throws Exception {
		
		model.addAttribute("memberList", memberService.memberList() );

		return new ModelAndView("admin/member");
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String memberAdd(MemberDto memberDto) throws Exception {
		
		memberService.memberAdd(memberDto);
		
		return "success";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String memberDelete(MemberDto memberDto) throws Exception {
		
		memberService.memberDelete(memberDto);
		
		return "success";
	}

}