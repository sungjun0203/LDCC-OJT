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
		ArrayList<CustomerVO> reAgeAndGenderList= new ArrayList<CustomerVO>();
		for(int i=0; i<7;i++){
			reAgeAndGenderList.add(new CustomerVO(i*10, 0, 0));
		}
		for(int i=0;i<reAgeAndGenderList.size();i++){
			int age=reAgeAndGenderList.get(i).getCustomerAge();
			for(int j=0;j<ageAndGenderList.size();j++){
				if(ageAndGenderList.get(j).getCustomerAge()==age){
					if(ageAndGenderList.get(j).getCustomerGender().equals("남")){
						reAgeAndGenderList.get(i).setMaleCount(ageAndGenderList.get(j).getCustomerCount());
					}else if(ageAndGenderList.get(j).getCustomerGender().equals("여")){
						reAgeAndGenderList.get(i).setFemaleCount(ageAndGenderList.get(j).getCustomerCount());
					}
				}
			}
		}
		return reAgeAndGenderList;
	}
	
	public ArrayList<VendingDto> getLocation() {
		return analysisDao.getLocation();
	}
	
	
	public ArrayList<VendingDto> getField(String vendingLocation) {
		return analysisDao.getField(vendingLocation);
	}

}
