package com.lotte.phone;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
		
		if(fujiUserDao.userCheck(fujiUserDto)==1) {
			fujiUserDao.fujiPhoneWrite(fujiUserDto);
		}
		else {
			
			if(fujiUserDto.getUserPosition()==null) {
				fujiUserDto.setUserPosition(".");
			}
			Integer userKey = fujiUserDao.fujiUserEtcAdd(fujiUserDto);
			
			fujiUserDao.fujiPhoneWrite(fujiUserDto);
		}
		
		
	}
	
	
	public ArrayList<FujiUserDto> getInfoList(){
		
		return fujiUserDao.getInfoList();
		
	}
	
	public ArrayList<FujiUserDto> getPhoneDateList(String wantDate) throws ParseException{
		
		
		return fujiUserDao.getPhoneDateList(wantDate);
		
	}
	
	public ArrayList<FujiUserDto> getPhoneSearchList(String searchData) throws ParseException{
		
		
		return fujiUserDao.getPhoneSearchList(searchData);
		
	}
	
	

}
