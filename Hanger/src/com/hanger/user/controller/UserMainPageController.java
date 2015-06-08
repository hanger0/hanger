package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserMainPageController extends BaseController {
	//
	@RequestMapping("/userMainPage.hang")
	public String userMainPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "user/mypage/UserPage.jsp");
		
		return moveUrl;
	}
}
