package com.lotte.vending;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VendingDao {
	
	Integer allVendingCount();
	Integer errVendingCount();
	
	
	ArrayList<HashMap<String,Object>> problemVending();
	
}

