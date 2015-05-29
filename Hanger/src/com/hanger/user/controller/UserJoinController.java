package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class UserJoinController extends BaseController {
	
	@RequestMapping("/join.hang")
	protected ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView() ;
		mav.setViewName("user/Join");
		
		System.out.println("MemberJoin...");
		return mav ;
	}
}