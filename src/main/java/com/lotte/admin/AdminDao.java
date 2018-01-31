package com.lotte.admin;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {
	
	Integer adminLoginCheck(AdminDto adminDto);
	
}

