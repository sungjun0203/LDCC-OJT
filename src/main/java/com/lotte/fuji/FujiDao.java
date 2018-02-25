package com.lotte.fuji;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FujiDao {
	
	// 로그인 체크
	Integer adminLoginCheck(FujiDto adminDto);
	
}

