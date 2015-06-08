package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserMyPageController extends BaseController {
	//
	@RequestMapping("/myPage.hang")
	public String userMainPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "user/mypage/MyTop.jsp");
		req.setAttribute("myPageUrl", root + "user/mypage/MyReview.jsp");
		
		return moveUrl;
	}
}
