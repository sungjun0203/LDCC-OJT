package com.lotte.vending;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VendingDao {
	
	Integer normalityVendingCount();
	Integer errVendingCount();
	
	
}

