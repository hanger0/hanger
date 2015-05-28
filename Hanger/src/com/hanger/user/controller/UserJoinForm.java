package com.hanger.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanger.common.BaseController;
import com.hanger.user.dao.UserJoinDao;
import com.hanger.user.vo.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class UserJoinForm extends BaseController {
	private UserJoinDao userJoinDao;
	
	public void setUserJoinDao(UserJoinDao userJoinDao) {
		this.userJoinDao = userJoinDao;
	}

	@RequestMapping(value="/result.hang", method=RequestMethod.POST)
	public ModelAndView memberJoinForm2(
			HttpServletRequest request
			) throws IOException {
		File dayFile = new File("F:\\hanger");
		String savePath = dayFile.getAbsolutePath();
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
		
		User user = new User();
		
		String userId = mul.getParameter("joinId");
		String name = mul.getParameter("name");
		String pw = mul.getParameter("pass1");
		String birth = mul.getParameter("year");
		String phone = mul.getParameter("mobile");
		String question = mul.getParameter("question");
		String answer = mul.getParameter("answer");
		String gender = mul.getParameter("gender");
		String postCode1 = mul.getParameter("zipCode1");
		String postCode2 = mul.getParameter("zipCode2");
		String addr1 = mul.getParameter("addr1");
		String addr2 = mul.getParameter("addr2");
		String ip = request.getRemoteAddr();
		
		user.setUserId(userId);
		user.setUserName(name);
		user.setUserPwd(pw);
		user.setUserBirth(birth);
		user.setUserPhone(phone);
		user.setUserQuestion(question);
		user.setUserAnswer(answer);
		user.setUserGender(gender);
		user.setUserPostCode1(postCode1);
		user.setUserPostCode2(postCode2);
		user.setUserAddr1(addr1);
		user.setUserAddr2(addr2);
		user.setUserPicPath("picPath");
		user.setUserPicOrgName("picOrgName");
		user.setUserPicSaveName("picSaveName");
		user.setRegId(userId);
		user.setRegIp(ip);
		user.setUpdId(userId);
		user.setUpdIp(ip);
		
		userJoinDao.insertHobby(user);
		
		System.out.println("memberJoinForm2 ½ÇÇà....");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("JoinResult");
		mav.addObject("userId", userId);
		mav.addObject("name", pw);
		
		return mav;
	}
}