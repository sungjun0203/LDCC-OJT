package com.lotte.vending;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VendingDao {
	
	public ArrayList<VendingDto> getVendingMachineInfo();
	public ArrayList<VendingDto> getStocks(int vendingId);
	public ArrayList<VendingDto> getDrinkSales(int vendingId);
	
	
}

