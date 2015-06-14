package com.hanger.mileage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.mileage.dao.UserMileageDao;

@Controller
public class UserMileageController extends BaseController{
	//
	private UserMileageDao userMileageDao;

	public void setUserMileageDao(UserMileageDao userMileageDao) {
		this.userMileageDao = userMileageDao;
	}
	
	@RequestMapping("/userMileage.hang")
	public String userMileage(HttpServletRequest req){
		HashMap<String, String> map = new HashMap<String, String>();
		userMileageDao.selectUserMileage(map);
		
		return moveUrl;
	}
}
