package com.lotte.vending;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class VendingService {
	
	@Autowired(required=false)
	private VendingDao vDao;
	
	public ArrayList<VendingDto> getVendingMachineInfo(){
		ArrayList<VendingDto> list = vDao.getVendingMachineInfo();
		for(VendingDto vd : list) 
			System.out.println(vd.getVendingId() + ", "+vd.getVendingLocation());
		
		return list;
	}
	
	public ArrayList<VendingDto> getStocks(int vendingId){
		ArrayList<VendingDto> list = vDao.getStocks(vendingId);
		for(VendingDto vd : list) 
			System.out.println(vd.getVendingId() + ", "+vd.getDrinkId()+", "+vd.getDrinkName()+", "+vd.getStockQuantity());
		
		return list;
	}
	
	public ArrayList<VendingDto> getDrinkSales(int vendingId){
		ArrayList<VendingDto> list = vDao.getDrinkSales(vendingId);
		return list;
	}
	public ArrayList<VendingDto> getState(int vendingId){
		ArrayList<VendingDto> list = vDao.getDrinkSales(vendingId);
		return list;
	}

	
	
	
	
	
	
	public VendingDto getVendingMachineInfo(Integer vendingId){
		
		return vDao.getVMInfo(vendingId);
	}
	
	public ArrayList<HashMap<String,Object>> getVmDrinksInfo(Integer vendingId){
		
		return vDao.getVmDrinksInfo(vendingId);
	}
	
	
	
}
