package com.hanger.manager.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;


@Controller
public class ManagerAddItem extends BaseController{
	@RequestMapping("/addItem.hang")
	protected ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView() ;
		mav.setViewName("ManagerAddItem"); //어떤 jsp로 가는지
		
		System.out.println("AddItem...");
		return mav;
	}
}
