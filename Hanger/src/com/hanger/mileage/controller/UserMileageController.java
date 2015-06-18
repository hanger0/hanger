package com.hanger.mileage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		userMileageDao.selectUseUserMileage(map);
		
		return moveUrl;
	}
}
