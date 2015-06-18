package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;

@Controller
public class UserLogoutController extends BaseController {
	
	@RequestMapping("/logout.hang")
	public String loginout(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		session.setAttribute("loginYn", "N");
		session.setAttribute("adminYn", "N");
		session.removeAttribute("myUserName");
		session.removeAttribute("myUserId");
		session.removeAttribute("myUserCode");
		session.removeAttribute("adminYn");
		session.removeAttribute("loginYn");
		session.removeAttribute("itemListForReview");
		session.invalidate();
		
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}