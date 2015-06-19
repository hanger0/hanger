package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.scrap.dao.UserScrapDao;
import com.hanger.scrap.vo.UserScrapVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserScrapPageController extends BaseController {
	//
	private UserScrapDao userScrapDao ;
	private UserSelectDao userSelectDao;
	
	public void setUserScrapDao(UserScrapDao userScrapDao) {
		this.userScrapDao = userScrapDao ;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/userScrapPage.hang")
	public String userTipPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		
		ArrayList<UserScrapVo> userScrapList = userScrapDao.selectUserScrap(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		req.setAttribute("user", user);
		req.setAttribute("userScrapList", userScrapList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/Scrap.jsp");
		
		return moveUrl;
	}
}
