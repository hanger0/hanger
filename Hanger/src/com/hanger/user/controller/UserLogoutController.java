package com.hanger.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class UserLogoutController extends BaseController {
	@RequestMapping("/logout.hang")
	public ModelAndView loginout(HttpSession session){
		System.out.println("logout.do ����");
		session.setAttribute("loginYn", "N");
		
		session.removeAttribute("ID");
		session.removeAttribute("password");
		
		moveUrl = "common/Frame";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("mainUrl", mainUrl);
		return mav;
	}
}