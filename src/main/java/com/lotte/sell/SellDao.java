package com.lotte.sell;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellDao {
	
	public void sellSubmit(HashMap<String,Object> sellInfo);
	public void stockSubmit(HashMap<String,Object> sellInfo);
	public void kakaoSubmit(HashMap<String,Object> sellInfo);
	
}

