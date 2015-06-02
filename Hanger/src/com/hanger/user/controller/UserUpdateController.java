package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.apps.mailreader.dao.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserUpdateDao;

@Controller
public class UserUpdateController extends BaseController {
	//
	private UserUpdateDao userUpdateDao;

	public void setUserUpdateDao(UserUpdateDao userUpdateDao) {
		this.userUpdateDao = userUpdateDao;
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(
			HttpServletRequest req,
			User user
			){
		userUpdateDao.update(user);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");
	
		return mav;
	}
}
