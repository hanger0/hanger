package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserTipPageController extends BaseController {
	//
	@RequestMapping("/userTipPage.hang")
	public String userTipPage(HttpServletRequest req){
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/UserTip.jsp");
		
		return moveUrl;
	}
}
