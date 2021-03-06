package com.lotte.fuji;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.admin.AdminDao;
import com.lotte.admin.AdminDto;

@Service
public class FujiService {

	@Autowired
	AdminDao adminDao;

	// 작성자 : 박성준
	// 로그인 체크
	public String adminLoginCheck(HttpSession session, AdminDto adminDto) {

		// 아이디와 비밀번호 둘다 일치하는 개수 검색
		if (adminDao.adminLoginCheck(adminDto) == 0) {
			return "fail";
		}

		else {
			// 로그인 성공시 세션 저장(SID)
			session.setAttribute("fujiUser", adminDto.getAdminId());
			return "success";
		}
	}

}
