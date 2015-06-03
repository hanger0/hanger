package com.hanger.manager.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class ManagerBrandController extends BaseController{
	@RequestMapping("/brand.hang")
	protected ModelAndView searchBrand(HttpServletRequest request, HttpServletResponse response){
		
		moveUrl = "manager/item/SearchBrand";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		
		System.out.println("SearchBrand...");
		return mav;
	}
}


