package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserJoinZipCodeDao;
import com.hanger.user.vo.ZipCodeVo;

@Controller
public class UserJoinZipCodeSearchController extends BaseController {
	//
	UserJoinZipCodeDao userJoinZipCodeDao;
	
	public void setUserJoinZipCodeDao(UserJoinZipCodeDao userJoinZipCodeDao) {
		this.userJoinZipCodeDao = userJoinZipCodeDao;
	}
	
	@RequestMapping("/zipCode.hang")
	public String goZipCodeSearch(){
		//
		log("zipCode 컨트롤러");
		
		return "user/ZipCodeSearch";
	}

	@RequestMapping("/zipCodeSearch.hang")
	public ModelAndView search(HttpServletRequest req){
		//
		log("zipCodeSearch 컨트롤러");
		
		String qt = req.getParameter("qt");
		List<ZipCodeVo> zipCodeList = userJoinZipCodeDao.searchZipCode(qt);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/ZipCodeSearch");
		mav.addObject("qt", qt);
		mav.addObject("zipCodeList", zipCodeList);
		
		System.out.println("qt:" + qt);
		System.out.println("UserJoinZipCodeSearch.......");
		
		return mav;
	}
}
