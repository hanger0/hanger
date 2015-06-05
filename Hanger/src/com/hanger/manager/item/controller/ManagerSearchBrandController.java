package com.hanger.manager.item.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.item.dao.ManagerSearchBrandDao;
import com.hanger.manager.item.vo.ManagerBrandVo;

@Controller
public class ManagerSearchBrandController extends BaseController{
	
	private ManagerSearchBrandDao managerSearchBrandDao;

	public void setManagerSearchBrandDao(ManagerSearchBrandDao managerSearchBrandDao) {
		this.managerSearchBrandDao = managerSearchBrandDao;
	}

	@RequestMapping("/managerSearchBrand.hang")
	public ModelAndView searchBrnad(
			@RequestParam("inputBrand") String inputBrand){
		
		moveUrl = "manager/item/ManagerBrandList";
		
		System.out.println("Brand check controller");
		
		List<ManagerBrandVo> brandList = managerSearchBrandDao.searchBrand(inputBrand);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("brandList", brandList);
		
		return mav;
	}
}
