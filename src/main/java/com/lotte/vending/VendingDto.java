package com.lotte.vending;

import java.util.ArrayList;

import com.lotte.drink.DrinkDto;

public class VendingDto {

	Integer vendingId;
	String vendingLocation;
	Integer vendingAsInfo;
	String vendingField;
	Integer sales;
	ArrayList<DrinkDto> drinkList;
	
	//
	
	String asName;
	public ArrayList<DrinkDto> getDrinkList() {
		return drinkList;
	}
	public void setDrinkList(ArrayList<DrinkDto> drinkList) {
		this.drinkList = drinkList;
	}
	String asPhone;
	
	
	public Integer getVendingId() {
		return vendingId;
	}
	public void setVendingId(Integer vendingId) {
		this.vendingId = vendingId;
	}
	public String getVendingLocation() {
		return vendingLocation;
	}
	public void setVendingLocation(String vendingLocation) {
		this.vendingLocation = vendingLocation;
	}
	public Integer getVendingAsInfo() {
		return vendingAsInfo;
	}
	public void setVendingAsInfo(Integer vendingAsInfo) {
		this.vendingAsInfo = vendingAsInfo;
	}
	public String getVendingField() {
		return vendingField;
	}
	public void setVendingField(String vendingField) {
		this.vendingField = vendingField;
	}
	public String getAsName() {
		return asName;
	}
	public void setAsName(String asName) {
		this.asName = asName;
	}
	public String getAsPhone() {
		return asPhone;
	}
	public void setAsPhone(String asPhone) {
		this.asPhone = asPhone;
	}
	public Integer getSales() {
		return sales;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}
	
	
	
	

}
