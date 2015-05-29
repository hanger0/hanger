package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.user.dao.UserJoinZipCodeDao;

@Controller
public class UserJoinZipCodeSearchController {
	//
	UserJoinZipCodeDao userJoinZipCodeDao;
	
	public void setUserJoinZipCodeDao(UserJoinZipCodeDao userJoinZipCodeDao) {
		this.userJoinZipCodeDao = userJoinZipCodeDao;
	}

	@RequestMapping("/zipCodeSearch.hang")
	public ModelAndView search(HttpServletRequest req){
		String qt = req.getParameter("qt");
		List zipCodeList = userJoinZipCodeDao.searchZipCode(qt);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/ZipCodeSearch");
		mav.addObject("qt", qt);
		mav.addObject("zipCodeList", zipCodeList);
		
		System.out.println("qt:" + qt);
		System.out.println("UserJoinZipCodeSearch.......");
		
		return mav;
	}
}
