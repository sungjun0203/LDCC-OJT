package com.lotte.sell;

import com.lotte.drink.DrinkDto;
import com.lotte.vending.VendingDto;

public class SellDto {
	
	Integer sellId;
	Integer vendingId;
	Integer drinkId;
	Integer customerAge;
	String customerGender;
	Integer customerCount;
	String sellDate;
	DrinkDto drinkDto;
	VendingDto vendingDto;
	
	public Integer getSellId() {
		return sellId;
	}
	public void setSellId(Integer sellId) {
		this.sellId = sellId;
	}
	public Integer getVendingId() {
		return vendingId;
	}
	public void setVendingId(Integer vendingId) {
		this.vendingId = vendingId;
	}
	public Integer getDrinkId() {
		return drinkId;
	}
	public void setDrinkId(Integer drinkId) {
		this.drinkId = drinkId;
	}
	public Integer getCustomerAge() {
		return customerAge;
	}
	public void setCustomerAge(Integer customerAge) {
		this.customerAge = customerAge;
	}
	public String getCustomerGender() {
		return customerGender;
	}
	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}
	public Integer getCustomerCount() {
		return customerCount;
	}
	public void setCustomerCount(Integer customerCount) {
		this.customerCount = customerCount;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}
	public DrinkDto getDrinkDto() {
		return drinkDto;
	}
	public void setDrinkDto(DrinkDto drinkDto) {
		this.drinkDto = drinkDto;
	}
	public VendingDto getVendingDto() {
		return vendingDto;
	}
	public void setVendingDto(VendingDto vendingDto) {
		this.vendingDto = vendingDto;
	}
	
	
}
