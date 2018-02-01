package com.lotte.analysis;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.vending.VendingDao;

@Service
public class VendingAnalysisService {
	
	@Autowired
	VendingDao vendingDao;
	
	public HashMap<String,Object> VendingCount() {
		
		
		HashMap<String,Object> vendingCount = new HashMap<String,Object>();
		
		Integer normalVendingCount = vendingDao.normalityVendingCount();
		Integer errVendingCount = vendingDao.errVendingCount();
		
		vendingCount.put("normalVendingCount", normalVendingCount);
		vendingCount.put("errVendingCount", errVendingCount);
		
		return vendingCount;
		
	}
	

}
