package com.lotte.analysis;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerVO;
import com.lotte.vending.VendingDto;

@Mapper
public interface AnalysisDao {
	ArrayList<VendingDto> getVendingMachineRanking();

	ArrayList<DrinkDto> getDrinkRankingById(VendingDto vendingDto);
	
	ArrayList<CustomerVO> getAgeAndGenderInfo(VendingDto vendingDto);
	
	 //추가
	Integer getTotalVendingCount();
	ArrayList<Integer> getTotalVendingId();
	ArrayList<DrinkDto> getAllDrinkInfoById(VendingDto vendingDto);
	DrinkDto getDrinkInfoByDrinkId(VendingDto vendingDto);

	ArrayList<HashMap<String, Object>> getTopDrinkInfo(VendingDto vendingDto);

	ArrayList<Integer> getTopThreeDrinkId(Integer vendingId);
}
