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
	
	private int stockId;
	private int drinkId;
	private int stockQuantity;
	private String drinkName;
	private String drinkPic;
	
	private int countForMale;
	private int countForFemale;
	
	private int countForTen;
	private int countForTwenty;
	private int countForThrity;
	private int countForForthy;
	
	
	
	
	public String getDrinkPic() {
		return drinkPic;
	}
	public void setDrinkPic(String drinkPic) {
		this.drinkPic = drinkPic;
	}
	public int getCountForTen() {
		return countForTen;
	}
	public void setCountForTen(int countForTen) {
		this.countForTen = countForTen;
	}
	public int getCountForTwenty() {
		return countForTwenty;
	}
	public void setCountForTwenty(int countForTwenty) {
		this.countForTwenty = countForTwenty;
	}
	public int getCountForThrity() {
		return countForThrity;
	}
	public void setCountForThrity(int countForThrity) {
		this.countForThrity = countForThrity;
	}
	public int getCountForForthy() {
		return countForForthy;
	}
	public void setCountForForthy(int countForForthy) {
		this.countForForthy = countForForthy;
	}
	public int getCountForFifty() {
		return countForFifty;
	}
	public void setCountForFifty(int countForFifty) {
		this.countForFifty = countForFifty;
	}
	private int countForFifty;
	
	String asName;


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


	public Integer getSales() {
		return sales;
	}


	public void setSales(Integer sales) {
		this.sales = sales;
	}


	public ArrayList<DrinkDto> getDrinkList() {
		return drinkList;
	}


	public void setDrinkList(ArrayList<DrinkDto> drinkList) {
		this.drinkList = drinkList;
	}


	public int getStockId() {
		return stockId;
	}


	public void setStockId(int stockId) {
		this.stockId = stockId;
	}


	public int getDrinkId() {
		return drinkId;
	}


	public void setDrinkId(int drinkId) {
		this.drinkId = drinkId;
	}


	public int getStockQuantity() {
		return stockQuantity;
	}


	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}


	public String getDrinkName() {
		return drinkName;
	}


	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}


	public int getCountForMale() {
		return countForMale;
	}


	public void setCountForMale(int countForMale) {
		this.countForMale = countForMale;
	}


	public int getCountForFemale() {
		return countForFemale;
	}


	public void setCountForFemale(int countForFemale) {
		this.countForFemale = countForFemale;
	}


	public String getAsName() {
		return asName;
	}


	public void setAsName(String asName) {
		this.asName = asName;
	}

	
	

}
