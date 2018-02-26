package com.lotte.phone;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FujiUserDao {
	
	
	ArrayList<String> getUserName();
	HashMap<String,Object> getUserInfo(String userName);
	void fujiPhoneWrite(FujiUserDto fujiUserDto);
	Integer fujiUserEtcAdd(FujiUserDto fujiUserDto);
	
	ArrayList<FujiUserDto> getInfoList();
	
	
	
	Integer userCheck(FujiUserDto fujiUserDto);
}

