package com.lotte.user;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.member.MemberDao;
import com.lotte.member.MemberDto;
import com.lotte.sell.SellDao;
import com.lotte.util.KakaoApiService;
import com.lotte.vending.VendingDao;
import com.lotte.vending.VendingDto;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	VendingDao vendingDao;
	
	@Autowired
	KakaoApiService kakaoApiService;
	
	@Autowired
	SellDao sellDao;
	
	
	public String userLoginCheck(HttpServletRequest request) {
		
		HashMap<String,Object> userInfo = new HashMap<String,Object>();
		String id = "guest";
		String pw = request.getParameter("pw");
		
		userInfo.put("id", id);
		userInfo.put("pw", pw);
		
		if(userDao.userLoginCheck(userInfo)==1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	public void vendingTrouble(Integer vendingId) throws Exception {
		
		
		ArrayList<MemberDto> asInfo = memberDao.getMemberList(vendingId);
		VendingDto vendingInfo  = vendingDao.getVMInfo(vendingId);
		
		
		if(asInfo!=null) {
			
				
				String msg = "[LSMO] 자판기 고장 알림 안내  "
						+ "담당 자판기의 고장 상황 안내 드립니다. "
						+ "담당자: " + asInfo.get(0).getAsName() + " "  + " (관리구역: " + vendingInfo.getVendingLocation()+ " ) "
						+ "문제상황 : 고장";
				
				KakaoApiService.sendMesageAPI(asInfo.get(0).getAsPhone(), msg);
				
				HashMap<String,Object> errorInfo = new HashMap<String,Object> ();
				
				errorInfo.put("asId", asInfo.get(0).getAsId());
				errorInfo.put("vendingId", vendingId);
				
				vendingDao.vendingError(vendingId);
			
		}
		
		
	}
	
	public Integer vendingErrCnt(Integer vendingId) {
		
		return vendingDao.vendingErrCnt(vendingId);
	}
	
	
	public HashMap<String,Object> vendingStockCheck(HashMap<String,Object> vendingSubmitInfo) {
		
		return vendingDao.vendingStockCheck(vendingSubmitInfo);
		
	}
	
	public void vendingSubmit(HashMap<String,Object> vendingSubmitInfo) throws Exception {
		
		HashMap<String,Object> sellInfo = new HashMap<String,Object>();
		
		String gender = null;
		if(vendingSubmitInfo.get("faceGender").equals("male")) {
			gender = "남";
		}
		else if(vendingSubmitInfo.get("faceGender").equals("female")) {
			gender="여";
		}
		else {
			gender=null;
		}
		
		
		Integer age = 0;
		
		if(vendingSubmitInfo.get("faceAge")!=null) {
			
			Double tempAge = Double.parseDouble((String) vendingSubmitInfo.get("faceAge"));
			int intAge = Integer.parseInt(String.valueOf(Math.round(tempAge)));
					
			age =  ( (intAge / 10) * 10);
		}
		
		else {
			age = null;
		}
		
		
		Integer drinkId = Integer.parseInt((String)vendingSubmitInfo.get("selectDrinkId"));
		Integer vendingId = Integer.parseInt((String)vendingSubmitInfo.get("vendingId"));
		Integer stock = Integer.parseInt((String)vendingSubmitInfo.get("stock"));
		
		ArrayList<MemberDto> asInfo = memberDao.getMemberList(vendingId);
		
		
		sellInfo.put("gender",gender);
		sellInfo.put("age",age);
		sellInfo.put("drinkId",drinkId);
		sellInfo.put("vendingId",vendingId);
		
		String msg = "[LSMO] 자판기 제고 알림 안내" + "음료명 : abcd" + "음료명 : abcd" + "음료명 : abcd"  ;
		
		if(stock <=4 && vendingSubmitInfo.get("sendCheck").equals("미전송")) {
			
			sellDao.kakaoSubmit(sellInfo);
			kakaoApiService.sendMesageAPI(asInfo.get(0).getAsPhone(), msg);
			System.out.println("카카오 전송");
		}
		
		else {
			sellDao.stockSubmit(sellInfo);
		}
		
		sellDao.sellSubmit(sellInfo);
		
		
		
		
		
		System.out.println("gender : " + gender);
		System.out.println("Age : " +  age);
		
		
		
		
		
		
	}
	
	

}
