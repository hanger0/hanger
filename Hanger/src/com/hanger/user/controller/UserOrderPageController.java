package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserOrderPageController extends BaseController {
	//
	@RequestMapping("/userOrderPage.hang")
	public String userTipPage(HttpServletRequest req){
		req.setAttribute("mainUrl", root + "user/mypage/OrderPage.jsp");
		
		return moveUrl;
	}
}