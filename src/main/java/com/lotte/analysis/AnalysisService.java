package com.lotte.analysis;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.drink.DrinkDto;
import com.lotte.vending.VendingDto;

@Service
public class AnalysisService {
	@Autowired
	AnalysisDao analysisDao;
	
	public ArrayList<VendingDto> getVendingMachineRanking(){
		ArrayList<VendingDto> vmRankingList = analysisDao.getVendingMachineRanking();
		return vmRankingList;
	}

	public ArrayList<DrinkDto> getDrinkRankingById(int vendingId) {
		return analysisDao.getDrinkRankingById(vendingId);
	}
}
