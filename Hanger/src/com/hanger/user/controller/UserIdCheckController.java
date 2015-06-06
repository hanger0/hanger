package com.hanger.user.controller;

import java.util.ArrayList;

import org.apache.struts.apps.mailreader.dao.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserIdCheckDao;

@Controller
public class UserIdCheckController extends BaseController {
	//
	private UserIdCheckDao userIdCheckDao;
	
	public void setUserIdCheckDao(UserIdCheckDao userIdCheckDao) {
		this.userIdCheckDao = userIdCheckDao;
	}

	@RequestMapping("/idCheck.hang")
	public ModelAndView idCheck(
			@RequestParam("joinId") String joinId
			){
		//
		log("idCheck 컨트롤러");
		
		moveUrl = "user/IdCheck";
		System.out.println("아이디 체크 controller");
		
		ArrayList<User> idCheckList = userIdCheckDao.idCheck(joinId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("idCheckList", idCheckList);
		mav.addObject("userId", joinId);

		return mav;
	}
}
