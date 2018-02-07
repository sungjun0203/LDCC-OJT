package com.lotte.util;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.lotte.drink.DrinkDto;

@Mapper
public interface CommonDao {
	
	ArrayList<HashMap<String,Object>> getVendingAllLocation();
	ArrayList<Integer> getVendingId(String vendingLocation);
	ArrayList<DrinkDto> getDrinkAnalysis(HashMap<String,Object> info);
	
}

