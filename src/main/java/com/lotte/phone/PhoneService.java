package com.lotte.phone;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhoneService {
	
	@Autowired
	FujiUserDao fujiUserDao;
	
	public ArrayList<String> getUserName(){
		
		return fujiUserDao.getUserName();
	}
	
	public HashMap<String,Object> getUserInfo(String userName){
		
		return fujiUserDao.getUserInfo(userName);
		
		
	}
	
	
	public void fujiPhoneWrite(FujiUserDto fujiUserDto) {
		
		fujiUserDao.fujiPhoneWrite(fujiUserDto);
		
		
	}
	
	

}
