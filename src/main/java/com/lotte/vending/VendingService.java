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
		/*for(VendingDto vd : list) 
			System.out.println(vd.getVendingId() + ", "+vd.getVendingLocation());
		*/
		return list;
	}
	
	public ArrayList<VendingDto> getStocks(int vendingId){
		ArrayList<VendingDto> list = vDao.getStocks(vendingId);
/*		for(VendingDto vd : list) 
			System.out.println(vd.getVendingId() + ", "+vd.getDrinkId()+", "+vd.getDrinkName()+", "+vd.getStockQuantity());
		*/
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

	public HashMap<String,Object> getVendingState(int vendingId){
		HashMap<String,Object> list = vDao.getVendingState(vendingId);
		return list;
	}
	public ArrayList<VendingDto> getLocation(String vendingLocation){
		ArrayList<VendingDto> list = vDao.getLocation(vendingLocation);
		return list;
	}
}
