package com.hanger.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "MainPage";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(
			@RequestParam("id") String userId,
			@RequestParam(value="pass", required=false) String pass,
			@RequestParam(value="age", defaultValue="0000") int age,
			HttpSession session ){
		//
		UserVo user = new UserVo();
		user.setUserId(userId);
		user.setUserPwd(pass);
		userLoginDao.getUser(user);
		
		List<UserVo> uvList = (List<UserVo>)userLoginDao.getUser(user);
		
		String message = "";
		if(uvList.size()>0)
		{
			System.out.println("�α��� ����");
			session.setAttribute("LoginYn", "Y");
			session.setAttribute("ID", userId);
			
			message = "�ݰ����ϴ�. " + userId + " ��";
		}
		else
		{
			System.out.println("�α��� ����");
			message = "ID �Ǵ� PassWord�� �߸� �Է��Ͽ����ϴ�.";
		}

		ModelAndView mav=new ModelAndView();
		mav.setViewName("Login");		// ó�� ����� �����ִ� �������� ��Ī
		mav.addObject("message", message);

		return mav;
	}
}
