package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class GoMyPage extends BaseController {
	//
	@RequestMapping("/goMyPage.hang")
	public String goMyPage(HttpServletRequest req){
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";

		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
