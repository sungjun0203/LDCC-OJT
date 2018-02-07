package com.lotte.allAnalysis;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.lotte.drink.DrinkDto;

@Mapper
public interface AllAnalysisDao {
	
	public ArrayList<HashMap<String,Object>> manAndWomanCnt();
	
	
	public ArrayList<DrinkDto> manSellRank();
	public ArrayList<DrinkDto> womanSellRank();
	
	public ArrayList<HashMap<String,Object>> locationSellRank();
	public ArrayList<HashMap<String,Object>> fieldSellRank();
	public ArrayList<HashMap<String,Object>> timeSellRank(HashMap<String,Object> viewInfo);
	
	public void timeSellViewCreate(HashMap<String,Object> viewInfo);
	
	public ArrayList<HashMap<String,Object>> allSalesInfo(HashMap<String,Object> viewInfo);
	public void viewCreate(HashMap<String,Object> viewInfo);
	public void viewDelete(HashMap<String,Object> viewInfo);
	
}

