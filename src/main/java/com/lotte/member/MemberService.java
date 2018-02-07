package com.lotte.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	
	@Autowired
	MemberDao memberDao;
	
	public ArrayList<MemberDto> memberList() {
		
		ArrayList<MemberDto> memberList = memberDao.memberList();
		
		return memberList;
	}
	
	public void memberAdd(MemberDto memberDto) {
		
		memberDao.memberAdd(memberDto);
	}
	
	public void memberDelete(MemberDto memberDto) {
		memberDao.memberDelete(memberDto);
	}
	
	public ArrayList<MemberDto> detailed(int asId) {
		return memberDao.detailed(asId);
	}

}
