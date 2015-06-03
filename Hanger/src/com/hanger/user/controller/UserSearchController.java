package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserSearchDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserSearchController extends BaseController {
	//
	private UserSearchDao userSearchDao;

	public void setUserSearchDao(UserSearchDao userSearchDao) {
		this.userSearchDao = userSearchDao;
	}
	
	@RequestMapping("/userSearch.hang")
	public String userSearch(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		String myUserCode = (String)session.getAttribute("myUserCode");
		String qt = req.getParameter("qt");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);
		
		req.setAttribute("userList", userList);
		moveUrl = "index3";
		return moveUrl;
	}
}
