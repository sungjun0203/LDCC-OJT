package com.lotte.analysis;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerService;
import com.lotte.sell.CustomerVO;
import com.lotte.vending.VendingDto;

@Service
public class AnalysisService {
	@Autowired
	AnalysisDao analysisDao;
	
	@Autowired
	CustomerService customerService;
	
	public ArrayList<VendingDto> getVendingMachineRanking(){
		ArrayList<VendingDto> vmRankingList = analysisDao.getVendingMachineRanking();
		return vmRankingList;
	}

	public ArrayList<DrinkDto> getDrinkRankingById(VendingDto vendingDto) {
		return analysisDao.getDrinkRankingById(vendingDto);
	}
	
	public ArrayList<CustomerVO> getAgeAndGenderAnalysis(VendingDto vendingDto){
		ArrayList<CustomerVO> ageAndGenderList= analysisDao.getAgeAndGenderInfo(vendingDto);
		for(int i =0; i<ageAndGenderList.size();i++){
			if(ageAndGenderList.get(i).getCustomerGender().equals("남")){
				ageAndGenderList.get(i).setMaleCount(ageAndGenderList.get(i).getCustomerCount());
			}else{
				ageAndGenderList.get(i).setFemaleCount(ageAndGenderList.get(i).getCustomerCount());
			}
		}
		return ageAndGenderList;
	}
}
