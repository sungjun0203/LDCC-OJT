package com.lotte.allAnalysis;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.drink.DrinkDto;

@Service
public class AllAnalysisService {
	
	@Autowired
	AllAnalysisDao allAnalysisDao;
	
	public HashMap<String,Object> humanInfo(){
		
		ArrayList<HashMap<String,Object>> manAndWomanCnt = allAnalysisDao.manAndWomanCnt();
		
		Long manCnt = (Long) manAndWomanCnt.get(0).get("cnt");
		Long womanCnt = (Long) manAndWomanCnt.get(1).get("cnt");
		Double humanCnt = (manCnt.doubleValue() + womanCnt.doubleValue());
		
		double manRatio = (manCnt/humanCnt * 100);
		double womanRatio = (int) (womanCnt/humanCnt * 100);
		
		HashMap<String,Object> humanInfo = new HashMap<String,Object>();
		
		humanInfo.put("manCnt", manCnt);
		humanInfo.put("womanCnt", womanCnt);
		humanInfo.put("humanCnt", humanCnt);
		
		return humanInfo;
	}
	
	public ArrayList<DrinkDto> manSellRank() {
		
		return allAnalysisDao.manSellRank();
	}
	
	public ArrayList<DrinkDto> womanSellRank() {
		
		return allAnalysisDao.womanSellRank();
	}
	
		
	public ArrayList<HashMap<String,Object>> locationSellRank() {
		return allAnalysisDao.locationSellRank();
	}

	public ArrayList<HashMap<String,Object>> fieldSellRank() {
	
		return allAnalysisDao.fieldSellRank();
	}
	
	
	public ArrayList<HashMap<String,Object>> timeSellRank() {
		
		long time = System.currentTimeMillis();
		String timeConvert = "t" + Long.toString(time);
		
		HashMap<String,Object> viewInfo = new HashMap<String,Object>();
		viewInfo.put("viewNm", timeConvert);
		
		System.out.println("view : " + timeConvert);
		
		allAnalysisDao.timeSellViewCreate(viewInfo);
		ArrayList<HashMap<String,Object>> timeSellRank = allAnalysisDao.timeSellRank(viewInfo);
		allAnalysisDao.viewDelete(viewInfo);
		
		return timeSellRank;
	}

}
