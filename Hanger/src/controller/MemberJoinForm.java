package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class MemberJoinForm extends AbstractController{
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("JoinResult ½ÇÇà....");

		String name = request.getParameter("name") ;
		String userId = request.getParameter("joinId");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JoinResult");
		
		mav.addObject("name", name);
		mav.addObject("userId", userId);
		
		System.out.println(name + "                    " + userId);
		return mav ;
	}
}