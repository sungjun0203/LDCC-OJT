package com.lotte.analysis;

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

import com.lotte.drink.DrinkDto;
import com.lotte.sell.CustomerVO;
import com.lotte.vending.VendingDto;

@Controller
public class AnalysisController {
	@Autowired
	AnalysisService analysisService;
	
/*	@RequestMapping("analysis/getIndividualAnalysisData.do")
	public ModelAndView getIndividualAnalysisData(){
		ModelAndView mv = new ModelAndView("analysis/individual_analysis_data");
		ArrayList<VendingDto> vmRankingList = analysisService.getVendingMachineRanking();
		mv.addObject("vmRankingList", vmRankingList);
		return mv;
	}
	
	@RequestMapping("analysis/getDrinkRankingByVendingId.do")
	@ResponseBody
	public ArrayList<DrinkDto> getDrinkRankingByVendingId(String vendingId){
		ArrayList<DrinkDto> drinkRankingByVendingId = analysisService.getDrinkRankingById(Integer.parseInt(vendingId));
		return drinkRankingByVendingId;
	}
	
	@RequestMapping("analysis/getAgeAndGenderAnalysis.do")
	@ResponseBody
	public HashMap<String,Integer> getAgeAndGenderAnalysis(VendingDto vendingDto){
		HashMap<String, Integer> sellInfo=analysisService.getAgeAndGenderAnalysis(vendingDto);
		return sellInfo;
	}*/
	
	
	@RequestMapping("analysis/getIndividualAnalysisData.do")
	public ModelAndView getIndividualAnalysisData(VendingDto vendingDto, Model d){
		
		ModelAndView mv = new ModelAndView("analysis/individual_analysis_data");
		ArrayList<VendingDto> vmRankingList = analysisService.getVendingMachineRanking();
		mv.addObject("vmRankingList", vmRankingList);
		mv.addObject("vendingId", vendingDto.getVendingId());
		ArrayList<DrinkDto> drinkRankingList = analysisService.getDrinkRankingById(vendingDto);
		mv.addObject("drinkRankingList", drinkRankingList);
		ArrayList<CustomerVO> sellInfoList=analysisService.getAgeAndGenderAnalysis(vendingDto);
		mv.addObject("sellInfoList",sellInfoList);
		d.addAttribute("location",analysisService.getLocation());
		ArrayList<CustomerVO> ageAndGenderList=analysisService.getAgeAndGenderAnalysis(vendingDto);
		mv.addObject("ageAndGenderList",ageAndGenderList);

		return mv;
	}
	
	@RequestMapping("analysis/getField")
	@ResponseBody
	public ArrayList<VendingDto> getField(@RequestParam("vendingLocation") String vendingLocation, HttpSession ses) {
		
		return analysisService.getField(vendingLocation);
	}
	
	@RequestMapping("analysis/getIndividualAnalysisData_test.do")
	public ModelAndView getIndividualAnalysisDataTest(VendingDto vendingDto){
		ModelAndView mv = new ModelAndView("analysis/individual_analysis_data2");
		ArrayList<VendingDto> vmRankingList = analysisService.getVendingMachineRanking();
		mv.addObject("vmRankingList", vmRankingList);
		mv.addObject("vendingId", vendingDto.getVendingId());
		ArrayList<DrinkDto> drinkRankingList = analysisService.getDrinkRankingById(vendingDto);
		mv.addObject("drinkRankingList", drinkRankingList);
		ArrayList<ArrayList<HashMap<String,Object>>> getDrinkSalesGraphInfo=analysisService.getDrinkSalesGraph(vendingDto);
		mv.addObject("getDrinkSalesGraphInfo",getDrinkSalesGraphInfo);
		if(vendingDto.getDrinkId()!=0){
			ArrayList<CustomerVO> ageAndGenderList=analysisService.getAgeAndGenderAnalysis(vendingDto);
			mv.addObject("ageAndGenderList",ageAndGenderList);
			mv.addObject("drinkName",analysisService.getDrinkInfoByDrinkId(vendingDto).getDrinkName() );
		}
		return mv;
	}
}
