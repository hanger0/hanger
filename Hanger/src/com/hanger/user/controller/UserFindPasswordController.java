package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

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
	
	public String findPassword(HttpServletRequest req){
		HttpSession session = req.getSession();
		String myUserId = (String)session.getAttribute("myUserId");
		String userAnswer = req.getParameter("userAnswer");
		String uesrQusetion = req.getParameter("uesrQusetion");
		
		UserVo user = new UserVo();
		user.setUserId(myUserId);
		user.setUserAnswer(userAnswer);
		user.setUserQuestion(uesrQusetion);
		
		String userPwd = userFindPasswordDao.selectPassword(user);
		if(userPwd != null && userPwd.length() > 0){
			req.setAttribute("userPwd", userPwd);
		}
		
		return moveUrl;
	}
}