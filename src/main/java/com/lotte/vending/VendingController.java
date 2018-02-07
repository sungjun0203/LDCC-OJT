package com.lotte.vending;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.analysis.VendingAnalysisService;
import com.lotte.drink.DrinkDto;
import com.lotte.drink.DrinkService;

@Controller

public class VendingController {
	@Autowired(required=false)
	private VendingService vService;
	VendingAnalysisService vendingAnalysisService;
	
	@RequestMapping("/vending")
	public String intro(@RequestParam(value = "machineNum", defaultValue = "0") int machineNum, HttpSession ses, Model d) {
			d.addAttribute("item",vService.getVendingMachineInfo());
			//d.addAttribute("problemVending", vendingAnalysisService.problemVending());
			ses.setAttribute("machineNum",machineNum);
		return "admin/vending";
	}
	
	@RequestMapping("/getDrinks")
	@ResponseBody
	public ArrayList<VendingDto> getStocks(@RequestParam("vendingId") int vendingId, HttpSession ses) {
		
		return vService.getStocks(vendingId);
		
		
	}
	
	@RequestMapping("/getDrinkSales")
	@ResponseBody
	public ArrayList<VendingDto> getDrinkSales(@RequestParam("vendingId") int vendingId) {
		return vService.getDrinkSales(vendingId);
	}
	@RequestMapping("/getVendingState")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> getVendingState(@RequestParam("vendingId") int vendingId) {
		ArrayList<HashMap<String, Object>> test = vService.getVendingState(vendingId);
		return test;
	}
	
	
	
}
