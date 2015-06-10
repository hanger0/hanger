package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserScrapPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/userScrapPage.hang")
	public String userTipPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String userCode = (String)session.getAttribute("myUserCode");
		
		UserVo user = userSelectDao.selectUser(userCode);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/Scrap.jsp");
		
		return moveUrl;
	}
}
