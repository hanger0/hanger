package com.hanger.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.BaseController;

@Controller
public class UserLogout extends BaseController {
	@RequestMapping("/logout.hang")
	public String loginout(HttpSession session){
		System.out.println("logout.do ½ÇÇà");
		session.setAttribute("LoginYn", "N");
		
		session.removeAttribute("ID");
		session.removeAttribute("password");
		
		return "Login";
	}
}
