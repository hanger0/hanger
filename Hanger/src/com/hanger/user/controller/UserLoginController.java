package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserLoginDao;
import com.hanger.user.vo.UserVo;

@Controller
@RequestMapping("/login.hang")
public class UserLoginController extends BaseController {
	private UserLoginDao userLoginDao;
	
	public void setUserLoginDao(UserLoginDao userLoginDao)
	{
		this.userLoginDao = userLoginDao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(){
		return "user/Login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(
			HttpServletRequest req){
		//
		session = req.getSession(false);
		String userId = req.getParameter("userId");
		String pass = req.getParameter("userPass");
		
		UserVo user = new UserVo();
		user.setUserId(userId);
		user.setUserPwd(pass);
		userLoginDao.getUser(user);
		System.out.println("로그인 컨트롤러");
		List<UserVo> uvList = (List<UserVo>)userLoginDao.getUser(user);
		
		String message = "";
		if(uvList != null && uvList.size()>0) {
			String name = (String)uvList.get(0).getUserName();
			System.out.println("로그인 성공");
			session.setAttribute("loginYn", "Y");
			session.setAttribute("userId", userId);
			session.setAttribute("name", name);
			
			message = "반갑습니다. " + name + " 님";
			moveUrl = "common/Frame";
		}
		else {
			System.out.println("로그인 실패");
			message = "ID 또는 PassWord를 잘못 입력하였습니다.";
			moveUrl = "user/Login";
		}

		ModelAndView mav=new ModelAndView();
		mav.setViewName(moveUrl);
		mav.addObject("message", message);
		mav.addObject("mainUrl", mainUrl);

		return mav;
	}
}
