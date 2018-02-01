package com.lotte.admin;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {
	
	// 로그인 체크
	Integer adminLoginCheck(AdminDto adminDto);
	
}

