package model.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberJoin {
	
	@RequestMapping("/join.do")
	protected ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView() ;
		mav.setViewName("MemberJoin");
		
		System.out.println("MemberJoin...");
		return mav ;
	}
}