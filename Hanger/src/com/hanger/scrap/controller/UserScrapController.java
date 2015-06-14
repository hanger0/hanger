package com.hanger.scrap.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.scrap.dao.UserScrapDao;
import com.hanger.scrap.vo.UserScrapVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserScrapController extends BaseController {
	//
	private UserScrapDao userScrapDao ;
	private UserSelectDao userSelectDao;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setUserScrapDao(UserScrapDao userScrapDao) {
		this.userScrapDao = userScrapDao ;
	}
	
	@RequestMapping(value = "/userScrapReview.hang", method=RequestMethod.GET)
	public String userScrap(HttpServletRequest req) {
		
		HttpSession session = req.getSession(false);
		String myUserCode = (String)session.getAttribute("myUserCode");
		
		HashMap map = new HashMap();
		map.put("myUserCode", myUserCode);
		
		ArrayList<UserScrapVo> userScrapList = userScrapDao.selectUserScrap(map);
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		req.setAttribute("user", user);
		req.setAttribute("userScrapList", userScrapList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/Scrap.jsp");
		
		return moveUrl ;
	}
}
