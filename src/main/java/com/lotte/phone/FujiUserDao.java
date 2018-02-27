package com.lotte.phone;


import java.sql.Date;
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
	ArrayList<FujiUserDto> getPhoneDateList(String wantDate);
	ArrayList<FujiUserDto> getPhoneSearchList(String searchData);
	
	ArrayList<FujiUserDto> allUserList();
	
	void infoDelete(Integer infoId);
	
	Integer userCheck(FujiUserDto fujiUserDto);
}

