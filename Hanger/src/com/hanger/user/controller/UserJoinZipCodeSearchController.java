package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "user/ZipCodeSearch";
	}

	@RequestMapping("/zipCodeSearch.hang")
	public String search(HttpServletRequest req){
		//
		String qt = req.getParameter("qt");
		List<ZipCodeVo> zipCodeList = userJoinZipCodeDao.searchZipCode(qt);
		
		req.setAttribute("qt", qt);
		req.setAttribute("zipCodeList", zipCodeList);
		
		System.out.println("qt:" + qt);
		System.out.println("UserJoinZipCodeSearch.......");
		
		return "user/ZipCodeSearch";
	}
}
