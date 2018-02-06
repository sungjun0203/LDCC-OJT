package com.lotte.sell;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


@Service
public class CustomerService {
	public ArrayList<CustomerVO> getCustomerAnalysis( ArrayList<CustomerVO> customerList){
		for(int i=0; i<customerList.size(); i++){
			int age = customerList.get(i).getCustomerAge();
			if(age>=0 && age<10){
				customerList.get(i).setCustomerAge(0);
			}else if(age>=10 && age<20){
				customerList.get(i).setCustomerAge(10);
			}else if(age>=20 && age<30){
				customerList.get(i).setCustomerAge(20);
			}else if(age>=30 && age<40){
				customerList.get(i).setCustomerAge(30);
			}else if(age>=40 && age<50){
				customerList.get(i).setCustomerAge(40);
			}else if(age>=50 && age<60){
				customerList.get(i).setCustomerAge(50);
			}else{
				customerList.get(i).setCustomerAge(60);
			}
		}
		
		return customerList;
	}
}
