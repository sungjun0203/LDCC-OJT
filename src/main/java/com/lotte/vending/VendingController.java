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
	public String intro(@RequestParam("page") String page, HttpSession ses, Model d) {
		System.out.println("vending test and page : "+page);
		ses.setAttribute("page", page);
		
		if(page.equals("machine")) {
			System.out.println("page = machine");
			d.addAttribute("item",vService.getVendingMachineInfo());
		}
		
		
		return "test2/test21";
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
	
	/*@RequestMapping("/getVendingMachineInfo")
	@ResponseBody
	public ArrayList<VendingDto> getVendingMachineInfo() {
		System.out.println("getVendingMachineInfo page");
		ArrayList<VendingDto> vDto = service.getVendingMachineInfo();
		return vDto;
	}*/
}