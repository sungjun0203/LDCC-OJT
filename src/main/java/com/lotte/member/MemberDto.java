package com.lotte.member;

public class MemberDto {
	
	Integer asId;
	String asName;
	String asPhone;
	String asLocation;
	
	String vendingId;
	String vendingLocation;
	String vendingField;
	
	public String getVendingId() {
		return vendingId;
	}
	public void setVendingId(String vendingId) {
		this.vendingId = vendingId;
	}
	public String getVendingLocation() {
		return vendingLocation;
	}
	public void setVendingLocation(String vendingLocation) {
		this.vendingLocation = vendingLocation;
	}
	public String getVendingField() {
		return vendingField;
	}
	public void setVendingField(String vendingField) {
		this.vendingField = vendingField;
	}
	public Integer getAsId() {
		return asId;
	}
	public void setAsId(Integer asId) {
		this.asId = asId;
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
	public String getAsLocation() {
		return asLocation;
	}
	public void setAsLocation(String asLocation) {
		this.asLocation = asLocation;
	}
	
}
