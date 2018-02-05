package com.lotte.analysis;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.vending.VendingDao;

@Service
public class VendingAnalysisService {
	
	@Autowired
	VendingDao vendingDao;
	
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
	

}
