package com.lotte.phone;

import java.sql.Date;
import java.sql.Timestamp;

public class FujiUserDto {
	
	Integer userId;
	String userName;
	String userPosition;
	String userPhone;
	String userGroup;
	
	Integer teamId;
	String teamName;
	String teamField;
	
	Integer groupId;
	String groupName;
	Integer groupTeam;
	
	Integer fieldId;
	String fieldName;
	
	String infoDescription;
	
	Timestamp infoTime;
	Integer infoId;
	
	

	public Integer getInfoId() {
		return infoId;
	}

	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}

	public Timestamp getInfoTime() {
		return infoTime;
	}

	public void setInfoTime(Timestamp infoTime) {
		this.infoTime = infoTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPosition() {
		return userPosition;
	}

	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(String userGroup) {
		this.userGroup = userGroup;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamField() {
		return teamField;
	}

	public void setTeamField(String teamField) {
		this.teamField = teamField;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getGroupTeam() {
		return groupTeam;
	}

	public void setGroupTeam(Integer groupTeam) {
		this.groupTeam = groupTeam;
	}

	public Integer getFieldId() {
		return fieldId;
	}

	public void setFieldId(Integer fieldId) {
		this.fieldId = fieldId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getInfoDescription() {
		return infoDescription;
	}

	public void setInfoDescription(String infoDescription) {
		this.infoDescription = infoDescription;
	}
	
	
	
	
	
	
	
	

}
