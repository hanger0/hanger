package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserHangOutPageController extends BaseController {
	//
	@RequestMapping("/userHangOutPage.hang")
	public String userTipPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "sns/hangOut/HangOutList.jsp");
		
		return moveUrl;
	}
}
