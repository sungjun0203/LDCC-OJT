package com.lotte.drink;

public class DrinkDto {
	
	Integer drinkId;
	String drinkName;
	Integer drinkPrice;
	String drinkCategory;
	
	Integer sellCnt;
	
	public Integer getDrinkId() {
		return drinkId;
	}
	public void setDrinkId(Integer drinkId) {
		this.drinkId = drinkId;
	}
	public String getDrinkName() {
		return drinkName;
	}
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	public Integer getDrinkPrice() {
		return drinkPrice;
	}
	public void setDrinkPrice(Integer drinkPrice) {
		this.drinkPrice = drinkPrice;
	}
	public String getDrinkCategory() {
		return drinkCategory;
	}
	public void setDrinkCategory(String drinkCategory) {
		this.drinkCategory = drinkCategory;
	}
	public Integer getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(Integer sellCnt) {
		this.sellCnt = sellCnt;
	}
	
	
	
}
