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
		
		// 존재여부 확인
		
		if(fujiUserDao.userCheck(fujiUserDto)==1) {
			fujiUserDao.fujiPhoneWrite(fujiUserDto);
		}
		else {
			Integer userKey = fujiUserDao.fujiUserEtcAdd(fujiUserDto);
			
			fujiUserDao.fujiPhoneWrite(fujiUserDto);
		}
		
		
		
	}
	
	
	public ArrayList<FujiUserDto> getInfoList(){
		
		return fujiUserDao.getInfoList();
		
	}
	
	

}
