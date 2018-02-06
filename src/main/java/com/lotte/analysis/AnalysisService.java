package com.lotte.analysis;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerService;
import com.lotte.sell.CustomerVO;
import com.lotte.sell.SellDto;
import com.lotte.vending.VendingDto;

@Service
public class AnalysisService {
	@Autowired
	AnalysisDao analysisDao;
	
	@Autowired
	CustomerService customerService;
	

	
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
	
	//추가
	
	public ArrayList<VendingDto> getVendingMachineRanking(){
		
		ArrayList<Integer> vendingIdList = analysisDao.getTotalVendingId();
		ArrayList<VendingDto> vendingList = analysisDao.getVendingMachineRanking();
		boolean flag=false;
		for(int k=0; k<vendingIdList.size();k++){
			for(int i=0; i<vendingList.size();i++){
				if(vendingList.get(i).getVendingId() == vendingIdList.get(k) ){
					flag=true;
					break;
				}
			}
			if(flag==false){
				VendingDto vendingDto = new VendingDto();
				vendingDto.setVendingId(vendingIdList.get(k));
				vendingDto.setSales(0);
				vendingList.add(vendingDto);
			}
			flag=false;
		}
		
		return vendingList;
	}
	
	public ArrayList<DrinkDto> getDrinkRankingById(VendingDto vendingDto) {
		ArrayList<DrinkDto> drinkInfoList = analysisDao.getAllDrinkInfoById(vendingDto);
		ArrayList<DrinkDto> drinkList = analysisDao.getDrinkRankingById(vendingDto);
		boolean flag=false;
		for(int k=0; k<drinkInfoList.size();k++){
			for(int i=0; i<drinkList.size();i++){
				if(drinkList.get(i).getDrinkId() == drinkInfoList.get(k).getDrinkId()){
					flag=true;
					break;
				}
			}
			if(flag==false){
				DrinkDto drinkDto = new DrinkDto();
				drinkDto.setDrinkId(drinkInfoList.get(k).getDrinkId());
				drinkDto.setDrinkName(drinkInfoList.get(k).getDrinkName());
				drinkDto.setDrinkCategory(drinkInfoList.get(k).getDrinkCategory());
				drinkDto.setDrinkPrice(drinkInfoList.get(k).getDrinkPrice());
				drinkDto.setSales(0);
				drinkList.add(drinkDto);
			}
			flag=false;
		}
		
		return drinkList;
	}
	
	public DrinkDto getDrinkInfoByDrinkId(VendingDto vendingDto){
		return analysisDao.getDrinkInfoByDrinkId(vendingDto);
	}
	
	
/*	public ArrayList<ArrayList<HashMap<String,Object>>> getDrinkSalesGraph(VendingDto vendingDto){
		Integer vendingId=vendingDto.getVendingId();
		ArrayList<Integer> TopThreeDrinkId = analysisDao.getTopThreeDrinkId(vendingId);
		ArrayList<ArrayList<HashMap<String,Object>>> getDrinkSalesGraphInfo = new ArrayList<ArrayList<HashMap<String,Object>>>();
		for (int i=0; i<TopThreeDrinkId.size();i++){ 
			VendingDto newVending=new VendingDto();
			newVending.setVendingId(vendingId);
			newVending.setDrinkId(TopThreeDrinkId.get(i));
			getDrinkSalesGraphInfo.add(analysisDao.getTopDrinkInfo(newVending));
			System.out.println("TOP3: "+TopThreeDrinkId.get(i));
		}
		return getDrinkSalesGraphInfo; 
	}*/
	
	//
	// 시간, 음료1, 음료2, 음료
	public ArrayList<ArrayList<HashMap<String,Object>>> getDrinkSalesGraph(VendingDto vendingDto){
		Integer vendingId=vendingDto.getVendingId();
		ArrayList<Integer> TopThreeDrinkId = analysisDao.getTopThreeDrinkId(vendingId);
		ArrayList<ArrayList<HashMap<String,Object>>> getDrinkSalesGraphInfo = new ArrayList<ArrayList<HashMap<String,Object>>>();
		for (int i=0; i<TopThreeDrinkId.size();i++){ 
			VendingDto newVending=new VendingDto();
			newVending.setVendingId(vendingId);
			newVending.setDrinkId(TopThreeDrinkId.get(i));
			getDrinkSalesGraphInfo.add(analysisDao.getTopDrinkInfo(newVending));
		}
		ArrayList<SellDto> oneDrink = new ArrayList<SellDto>();
		ArrayList<SellDto> twoDrink = new ArrayList<SellDto>();
		ArrayList<SellDto> threeDrink = new ArrayList<SellDto>();
		return getDrinkSalesGraphInfo; 
	}
	
}
