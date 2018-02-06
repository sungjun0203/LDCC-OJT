package com.lotte.vending;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VendingDao {
	
	public ArrayList<VendingDto> getVendingMachineInfo();
	public ArrayList<VendingDto> getStocks(int vendingId);
	public ArrayList<VendingDto> getDrinkSales(int vendingId);
	public ArrayList<VendingDto> getState(int vendingId);

	Integer allVendingCount();
	Integer errVendingCount();
	
	ArrayList<HashMap<String,Object>> problemVending();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<VendingDto> getVMInfo(Integer vendingId);
}

