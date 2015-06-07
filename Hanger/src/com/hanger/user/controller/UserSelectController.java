package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserSelectController extends BaseController {
	//
	private UserSelectDao userSelectDao;

	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/selectUser.hang")
	public String selectUser(HttpServletRequest req){
		//
		String userCode = req.getParameter("userCode");
		
		UserVo user = userSelectDao.selectUser(userCode);
		
		return moveUrl;
	}
}
