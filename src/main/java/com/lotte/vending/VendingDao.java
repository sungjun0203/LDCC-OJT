
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

	ArrayList<HashMap<String, Object>> problemVending();

	ArrayList<HashMap<String, Object>> getVendingState(int vendingId);

	ArrayList<VendingDto> getLocation(String vendingLocation);

	Integer allVendingCount();

	Integer errVendingCount();

	// 에러발생
	public void vendingError(Integer vendingId);

	public Integer vendingErrCnt(Integer vendingId);

	public ArrayList<HashMap<String, Object>> getVmDrinksInfo(Integer vendingId);

	public VendingDto getVMInfo(Integer vendingId);
	
	
	public HashMap<String,Object> vendingStockCheck(HashMap<String,Object> vendingSubmitInfo);
}
