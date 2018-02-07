package com.lotte.analysis;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.allAnalysis.AllAnalysisDao;
import com.lotte.vending.VendingDao;

@Service
public class VendingAnalysisService {
	
	@Autowired
	VendingDao vendingDao;
	
	@Autowired
	AllAnalysisDao allAnalysisDao;
	
	public HashMap<String,Object> vendingCount() {
		
		
		HashMap<String,Object> vendingCount = new HashMap<String,Object>();
		
		Integer allVendingCount = vendingDao.allVendingCount();
		Integer errVendingCount = vendingDao.errVendingCount();
		
		vendingCount.put("allVendingCount", allVendingCount);
		vendingCount.put("normalVendingCount", allVendingCount - errVendingCount);
		vendingCount.put("errVendingCount", errVendingCount);
		
		return vendingCount;
		
	}
	
	public ArrayList<HashMap<String,Object>> problemVending(){
		
		ArrayList<HashMap<String,Object>> problemVendingInfo = vendingDao.problemVending();
		
		return problemVendingInfo;
		
	}
	
	public ArrayList<HashMap<String,Object>> allSalesInfo(){
		
		long time = System.currentTimeMillis();
		String timeConvert = "t" + Long.toString(time);
		
		HashMap<String,Object> viewInfo = new HashMap<String,Object>();
		viewInfo.put("viewNm", timeConvert);
		
		allAnalysisDao.viewCreate(viewInfo);
		ArrayList<HashMap<String,Object>> allSalesInfo = allAnalysisDao.allSalesInfo(viewInfo);
		allAnalysisDao.viewDelete(viewInfo);
		
		
		return allSalesInfo;
	}
	

}
