package com.lotte.user;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	
	public String userLoginCheck(HttpServletRequest request) {
		
		HashMap<String,Object> userInfo = new HashMap<String,Object>();
		String id = "guest";
		String pw = request.getParameter("pw");
		
		userInfo.put("id", id);
		userInfo.put("pw", pw);
		
		if(userDao.userLoginCheck(userInfo)==1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	
	

}
