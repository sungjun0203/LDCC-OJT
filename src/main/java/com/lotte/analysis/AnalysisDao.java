package com.lotte.analysis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerVO;
import com.lotte.vending.VendingDto;

@Mapper
public interface AnalysisDao {
	ArrayList<VendingDto> getVendingMachineRanking();

	ArrayList<DrinkDto> getDrinkRankingById(VendingDto vendingDto);
	
	ArrayList<CustomerVO> getAgeAndGenderInfo(VendingDto vendingDto);
	ArrayList<VendingDto> getLocation();
	ArrayList<VendingDto> getField(String vendingLocation);
}
