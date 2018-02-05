package com.lotte.vending;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.drink.DrinkDto;
import com.lotte.drink.DrinkService;

@Controller

public class VendingController {
	@Autowired(required=false)
	private VendingService vService;
	
	@RequestMapping("/vending")
	public String intro(HttpSession ses, Model d) {
		
			d.addAttribute("item",vService.getVendingMachineInfo());
		
		return "admin/vending";
	}
	
	@RequestMapping("/getDrinks")
	@ResponseBody
	public ArrayList<VendingDto> getStocks(@RequestParam("vendingId") int vendingId) {
		System.out.println("GetDrinks and vendingId : "+vendingId);
		return vService.getStocks(vendingId);
	}
	
	@RequestMapping("/getDrinkSales")
	@ResponseBody
	public ArrayList<VendingDto> getDrinkSales(@RequestParam("vendingId") int vendingId) {
		System.out.println("getDrinkSales and vendingId : "+vendingId);
		return vService.getDrinkSales(vendingId);
	}
	
	
}
