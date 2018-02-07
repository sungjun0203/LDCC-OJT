package com.lotte.util;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {
	
	@Autowired
	CommonDao commonDao;
	
	public ArrayList<HashMap<String,Object>> getVendingAllLocation(){
		
		return commonDao.getVendingAllLocation();
		
	}
	
	
	public ArrayList<Integer> getVendingId(String vendingLocation){
		
		return commonDao.getVendingId(vendingLocation);
	}
	

}
