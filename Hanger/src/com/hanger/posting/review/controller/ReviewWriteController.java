package com.hanger.posting.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class ReviewWriteController extends BaseController{
	@RequestMapping("/reviewWrite.hang")
	public ModelAndView mainPage(HttpServletRequest request, HttpSession session) {		
		System.out.println("Review Write Controller...");
		
		ModelAndView mav = new ModelAndView();
		moveUrl = "posting/review/ReviewWriteEditor";
		mav.setViewName(moveUrl);
		
		return mav;
	}
}
