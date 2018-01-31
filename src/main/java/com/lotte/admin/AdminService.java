package com.lotte.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	AdminDao adminDao;
	
	public String adminLoginCheck(AdminDto adminDto) {
		
		System.out.println("Admin Id : " + adminDto.getAdminId());
		System.out.println("Admin Pw : " + adminDto.getAdminPw());
		
		System.out.println("admin check : " + adminDao.adminLoginCheck(adminDto));
		
		if(adminDao.adminLoginCheck(adminDto)==0)
			return "fail";
		else
			return "success";
		
	}

}
