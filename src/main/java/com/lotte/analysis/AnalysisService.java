package com.lotte.analysis;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerService;
import com.lotte.sell.CustomerVO;
import com.lotte.sell.SellDto;
import com.lotte.sell.TopSellVO;
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
	
	
	public ArrayList<TopSellVO> getDrinkSalesGraphByMonth(VendingDto vendingDto){
		System.out.println("month시작----------------------------");
		Integer vendingId=vendingDto.getVendingId();
		ArrayList<Integer> TopThreeDrinkId = analysisDao.getTopThreeDrinkId(vendingId); //TOP3음료 아이디 뽑아오기
		ArrayList<ArrayList<SellDto>> drinkSalesGraphInfo = new ArrayList<ArrayList<SellDto>>(); //top3 db에서 뽑은 값
		
		ArrayList<TopSellVO> reDrinkSalesGraphInfo = new ArrayList<TopSellVO>();
		for (int i=0; i<TopThreeDrinkId.size();i++){  // TOP3음료 아이디 뽑고 List로 만들기
			VendingDto newVending=new VendingDto();
			newVending.setVendingId(vendingId);
			newVending.setDrinkId(TopThreeDrinkId.get(i));
			ArrayList<SellDto> sell=analysisDao.getTopDrinkInfoByMonth(newVending); //시간대별 판매리스트
			drinkSalesGraphInfo.add(sell);
		}
		for(int k=0; k<drinkSalesGraphInfo.size(); k++){
			for(int i=0; i<drinkSalesGraphInfo.get(k).size(); i++){
				System.out.println("데이터 : " + drinkSalesGraphInfo.get(k).get(i).getSellDate1()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getCustomerCount()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getDrinkName());
			}
			System.out.println("----------------------------");
		}
		
		for(int i=0; i<12;i++){
			TopSellVO topSellVO = new TopSellVO();
			topSellVO.setSellDate(i+1);
			Integer data = 0;
			String dataName="";
			for(int k=0; k<drinkSalesGraphInfo.size();k++){
				data=drinkSalesGraphInfo.get(k).get(i).getCustomerCount();
				dataName=drinkSalesGraphInfo.get(k).get(i).getDrinkName();
				if(k==0){
					topSellVO.setDrink1(data);
					topSellVO.setDrink1Name(dataName);
				}else if(k==1){
					topSellVO.setDrink2(data);
					topSellVO.setDrink2Name(dataName);
				}else{
					topSellVO.setDrink3(data);
					topSellVO.setDrink3Name(dataName);
				}
			}
			reDrinkSalesGraphInfo.add(topSellVO);
		}
		
		for(int i=0; i<reDrinkSalesGraphInfo.size(); i++){
				System.out.println("데이터 : " + reDrinkSalesGraphInfo.get(i).getSellDate()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink1()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink2()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink3());
				System.out.println("데이터 : " + reDrinkSalesGraphInfo.get(i).getSellDate()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink1Name()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink2Name()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink3Name());
			System.out.println("----------------------------");
		}
		
		return reDrinkSalesGraphInfo; 
	}
	
	public ArrayList<TopSellVO> getDrinkSalesGraphByTime(VendingDto vendingDto){
		System.out.println("time시작----------------------------");
		Integer vendingId=vendingDto.getVendingId();
		ArrayList<Integer> TopThreeDrinkId = analysisDao.getTopThreeDrinkId(vendingId); //TOP3음료 아이디 뽑아오기
		ArrayList<ArrayList<SellDto>> drinkSalesGraphInfo = new ArrayList<ArrayList<SellDto>>(); //top3 db에서 뽑은 값
		
		ArrayList<TopSellVO> reDrinkSalesGraphInfo = new ArrayList<TopSellVO>();
		for (int i=0; i<TopThreeDrinkId.size();i++){  // TOP3음료 아이디 뽑고 List로 만들기
			VendingDto newVending=new VendingDto();
			newVending.setVendingId(vendingId);
			newVending.setDrinkId(TopThreeDrinkId.get(i));
			ArrayList<SellDto> sell=analysisDao.getTopDrinkInfoByTime(newVending); //시간대별 판매리스트
			drinkSalesGraphInfo.add(sell);
		}

				for(int k=0; k<drinkSalesGraphInfo.size(); k++){
		for(int i=0; i<drinkSalesGraphInfo.get(k).size(); i++){
			System.out.println("데이터 : " + drinkSalesGraphInfo.get(k).get(i).getSellDate1()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getCustomerCount()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getDrinkName());
		}
		System.out.println("----------------------------");
	}
		
		
		for(int i=0; i<24;i++){
			TopSellVO topSellVO = new TopSellVO();
			topSellVO.setSellDate(i);
			Integer data = 0;
			String dataName="";
			for(int k=0; k<drinkSalesGraphInfo.size();k++){
				data=drinkSalesGraphInfo.get(k).get(i).getCustomerCount();
				dataName=drinkSalesGraphInfo.get(k).get(i).getDrinkName();
				if(k==0){
					topSellVO.setDrink1(data);
					topSellVO.setDrink1Name(dataName);
				}else if(k==1){
					topSellVO.setDrink2(data);
					topSellVO.setDrink2Name(dataName);
				}else{
					topSellVO.setDrink3(data);
					topSellVO.setDrink3Name(dataName);
				}
			}
			reDrinkSalesGraphInfo.add(topSellVO);
		}
		for(int i=0; i<reDrinkSalesGraphInfo.size(); i++){
			System.out.println("데이터 : " + reDrinkSalesGraphInfo.get(i).getSellDate()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink1()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink2()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink3());
			System.out.println("데이터 : " + reDrinkSalesGraphInfo.get(i).getSellDate()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink1Name()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink2Name()+ "   ,  " + reDrinkSalesGraphInfo.get(i).getDrink3Name());
		System.out.println("----------------------------");
	}
		return reDrinkSalesGraphInfo; 
	}
	
	public ArrayList<TopSellVO> getDrinkSalesGraphByTimeByDrinkId(VendingDto vendingDto){
		
		Integer vendingId=vendingDto.getVendingId();
		ArrayList<ArrayList<SellDto>> drinkSalesGraphInfo = new ArrayList<ArrayList<SellDto>>(); //top3 db에서 뽑은 값
		ArrayList<TopSellVO> reDrinkSalesGraphInfo = new ArrayList<TopSellVO>();
		
		if(vendingDto.getDrinkId()!=0){ //드링크선택시
			ArrayList<SellDto> sell=analysisDao.getTopDrinkInfoByTime(vendingDto);
			drinkSalesGraphInfo.add(sell);
		}else{ //선택안할경우
			ArrayList<Integer> TopThreeDrinkId = analysisDao.getTopThreeDrinkId(vendingId); //TOP3음료 아이디 뽑아오기
			
			for (int i=0; i<TopThreeDrinkId.size();i++){  // TOP3음료 아이디 뽑고 List로 만들기
				VendingDto newVending=new VendingDto();
				newVending.setVendingId(vendingId);
				newVending.setDrinkId(TopThreeDrinkId.get(i));
				ArrayList<SellDto> sell=analysisDao.getTopDrinkInfoByTime(newVending); //시간대별 판매리스트
				drinkSalesGraphInfo.add(sell);
			}
		}
		
				for(int k=0; k<drinkSalesGraphInfo.size(); k++){
		for(int i=0; i<drinkSalesGraphInfo.get(k).size(); i++){
			System.out.println("데이터 : " + drinkSalesGraphInfo.get(k).get(i).getSellDate1()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getCustomerCount()+ "   ,  " + drinkSalesGraphInfo.get(k).get(i).getDrinkName());
		}
		System.out.println("----------------------------");
	}
		
		
		
		for(int i=0; i<24;i++){
			TopSellVO topSellVO = new TopSellVO();
			topSellVO.setSellDate(i);
			Integer data = 0;
			String dataName="";
			for(int k=0; k<drinkSalesGraphInfo.size();k++){
				data=drinkSalesGraphInfo.get(k).get(i).getCustomerCount();
				dataName=drinkSalesGraphInfo.get(k).get(i).getDrinkName();
				if(k==0){
					topSellVO.setDrink1(data);
					topSellVO.setDrink1Name(dataName);
				}else if(k==1){
					topSellVO.setDrink2(data);
					topSellVO.setDrink2Name(dataName);
				}else{
					topSellVO.setDrink3(data);
					topSellVO.setDrink3Name(dataName);
				}
			}
			reDrinkSalesGraphInfo.add(topSellVO);
		}

		return reDrinkSalesGraphInfo; 
	}
	
}
