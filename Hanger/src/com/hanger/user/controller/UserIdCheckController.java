package com.hanger.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.apps.mailreader.dao.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String idCheck(
			HttpServletRequest req
			){
		//
		moveUrl = "user/IdCheck";
		String joinId = req.getParameter("joinId");
		System.out.println("아이디 체크 controller");
		
		ArrayList<User> idCheckList = userIdCheckDao.idCheck(joinId);
		
		req.setAttribute("idCheckList", idCheckList);
		req.setAttribute("userId", joinId);

		return moveUrl;
	}
}
