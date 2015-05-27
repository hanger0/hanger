package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberJoinForm{

	@RequestMapping(value="/result.do", method=RequestMethod.GET)
	public String memberJoinForm(){
		System.out.println("memberJoinForm 실행....");
		return "JoinResult";
	}
	
	@RequestMapping(value="/result.do", method=RequestMethod.POST)
	protected ModelAndView memberJoinForm2(
			@RequestParam("name") String name
			) {
		System.out.println("memberJoinForm2 실행....");
		
		String userId = "joinId";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JoinResult");
		
		mav.addObject("name", name);
		mav.addObject("userId", userId);
		
		System.out.println(name + "                    " + userId);
		return mav ;
	}
}