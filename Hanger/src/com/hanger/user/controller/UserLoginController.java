package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemListForReviewDao;
import com.hanger.user.dao.UserLoginDao;
import com.hanger.user.vo.UserVo;

@Controller
@RequestMapping("/login.hang")
public class UserLoginController extends BaseController {
	
	private UserLoginDao userLoginDao;	
	private ItemListForReviewDao itemListForReviewDao;
	
	public void setUserLoginDao(UserLoginDao userLoginDao)
	{
		this.userLoginDao = userLoginDao;
	}
	public void setItemListForReviewDao(ItemListForReviewDao itemListForReviewDao) {
		this.itemListForReviewDao = itemListForReviewDao;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String form(){
		return "user/Login";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(
			HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		session = req.getSession(false);
		String userId = req.getParameter("userId");
		String pass = req.getParameter("userPass");
		
		UserVo user = new UserVo();
		user.setUserId(userId);
		user.setUserPwd(pass);
		
		List<UserVo> uvList = (List<UserVo>)userLoginDao.loginUser(user);
		
		String message = "";
		if(uvList != null && uvList.size()>0) {
			String myName = (String)uvList.get(0).getUserName();
			String userCode = (String)uvList.get(0).getUserCode();
			String adminYn = (String)uvList.get(0).getUserAdminYn();
			String myUserPicPath = (String)uvList.get(0).getUserPicPath();
			String myUserPicSaveName = (String)uvList.get(0).getUserPicSaveName();
			System.out.println("로그인 성공");
			session.setAttribute("loginYn", "Y");
			session.setAttribute("myUserId", userId);
			session.setAttribute("myUserName", myName);
			session.setAttribute("myUserCode", userCode);
			session.setAttribute("myUserPicPath", myUserPicPath);
			session.setAttribute("myUserPicSaveName", myUserPicSaveName);
			session.setAttribute("adminYn", adminYn);
			
			ArrayList itemListForReview = (ArrayList)itemListForReviewDao.getItemListForReview(userCode);
			session.setAttribute("itemListForReview", itemListForReview);
			message = null;
			moveUrl = "common/Frame";
		}
		else {
			System.out.println("로그인 실패");
			message = "ID 또는 PassWord를 잘못 입력하였습니다.";
			moveUrl = "user/Login";
		}

		req.setAttribute("message", message);
		req.setAttribute("mainUrl", mainUrl);

		return moveUrl;
	}
}
