package com.hanger.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
		String qt = req.getParameter("qt");
		ArrayList<UserVo> userList = userSearchDao.searchUser(qt);
		
		req.setAttribute("userList", userList);
		moveUrl = "index3";
		return moveUrl;
	}
}
