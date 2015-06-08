package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserFindPasswordDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserFindPasswordController extends BaseController {
	//
	private UserFindPasswordDao userFindPasswordDao;

	public void setUserFindPasswordDao(UserFindPasswordDao userFindPasswordDao) {
		this.userFindPasswordDao = userFindPasswordDao;
	}
	
	@RequestMapping(value="/findPassword.hang", method=RequestMethod.GET)
	public String goFindPage(){
		moveUrl = "user/PasswordSearch";
		return moveUrl;
	}
	
	@RequestMapping(value="/findPassword.hang", method=RequestMethod.POST)
	public String findPassword(HttpServletRequest req){
		//
		String myUserId = req.getParameter("myUserId");
		String userAnswer = req.getParameter("userAnswer");
		String userQusetion = req.getParameter("userQusetion");
		UserVo user = new UserVo();
		user.setUserId(myUserId);
		user.setUserAnswer(userAnswer);
		user.setUserQuestion(userQusetion);
		
		String message = "";
		
		String userPwd = userFindPasswordDao.selectPassword(user);
		if(userPwd != null && userPwd.length() > 0){
			req.setAttribute("userPwd", userPwd);
		} else {
			message = "다시 입력해주세요.";
			req.setAttribute("message", message);
		}
		moveUrl = "user/PasswordSearch";
		return moveUrl;
	}
}
