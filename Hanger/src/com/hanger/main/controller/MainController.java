package com.hanger.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class MainController extends BaseController {
	
	@RequestMapping("/main.hang")
	public ModelAndView mainPage(HttpServletRequest request, HttpSession session) {		
		System.out.println("메인 컨트롤러.java");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("mainUrl", mainUrl);
		
		return mav;
	}
}
