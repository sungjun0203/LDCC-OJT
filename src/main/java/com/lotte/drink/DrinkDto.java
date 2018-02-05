package com.lotte.drink;

public class DrinkDto {
	
	Integer drinkId;
	String drinkName;
	Integer drinkPrice;
	String drinkCategory;
	Integer sales;
	
	
	public Integer getSales() {
		return sales;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}
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
	
}
