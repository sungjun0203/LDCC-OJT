package com.lotte.user;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
	
	Integer userLoginCheck(HashMap<String,Object> userInfo);
	
}

