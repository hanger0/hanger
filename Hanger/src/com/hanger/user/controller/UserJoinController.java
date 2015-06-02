package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;

@Controller
public class UserJoinController extends BaseController {
	
	@RequestMapping("/join.hang")
	protected ModelAndView memberJoin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		ModelAndView mav = new ModelAndView() ;
		if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y")) {
			mav.setViewName(moveUrl);
			mav.addObject("mainUrl", mainUrl);
			mav.addObject("message", "�̹� �α��ε� �����Դϴ�.");
		} else {
			mav.setViewName("user/Join");
		}
		
		System.out.println("MemberJoin...");
		return mav ;
	}
}