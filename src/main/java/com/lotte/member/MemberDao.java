package com.lotte.member;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
	
	ArrayList<MemberDto> memberList();
	
	void memberAdd(MemberDto memberDto);
	void memberDelete(MemberDto memberDto);
	
	
	ArrayList<MemberDto> getMemberList(Integer vendingId);
	
}

