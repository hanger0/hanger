package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.BaseController;
import com.hanger.user.dao.UserLoginDao;
import com.hanger.user.vo.User;

@Controller
@RequestMapping("/login.do")
public class UserLogin extends BaseController {
	private UserLoginDao loginDao;
	
	public UserLogin()
	{}

	public void setLoginDao(UserLoginDao loginDao)
	{
		this.loginDao = loginDao;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(
			@RequestParam("id") String userId,
			@RequestParam(value="pass", required=false) String pass,
			@RequestParam(value="age", defaultValue="0000") int age,
			HttpSession session ){
		//
		Object[] paramArr = {userId, pass};
		loginDao.setParamArr(paramArr);
		
		List<User> uvList = (List<User>)loginDao.executeSelect();
		
		String message = "";
		if(uvList.size()>0)
		{
			System.out.println("로그인 성공");
			session.setAttribute("LoginYn", "Y");
			session.setAttribute("ID", userId);
			
			message = "반갑습니다. " + userId + " 님";
		}
		else
		{
			System.out.println("로그인 실패");
			message = "ID 또는 PassWord를 잘못 입력하였습니다.";
		}

		ModelAndView mav=new ModelAndView();
		mav.setViewName(root + "Login");		// 처리 결과를 보여주는 페이지의 별칭
		mav.addObject("message", message);

		return mav;
	}
}
