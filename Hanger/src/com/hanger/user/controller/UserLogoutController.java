package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class UserLogoutController extends BaseController {
	@RequestMapping("/logout.hang")
	public ModelAndView loginout(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		session.setAttribute("loginYn", "N");
		session.setAttribute("adminYn", "N");
		session.removeAttribute("myUserName");
		session.removeAttribute("myUserId");
		session.removeAttribute("myUserCode");
		session.removeAttribute("adminYn");
		session.removeAttribute("loginYn");
		session.removeAttribute("itemListForReview");
		session.invalidate();
		
		moveUrl = "common/Frame";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("mainUrl", mainUrl);
		return mav;
	}
}