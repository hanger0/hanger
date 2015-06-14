package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.vo.ReviewVo;
import com.hanger.user.dao.UserReviewDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserMyPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	private UserReviewDao userReviewDao ;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setUserReviewDao(UserReviewDao userReviewDao) {
		this.userReviewDao = userReviewDao ;
	}

	@RequestMapping("/myPage.hang")
	public String userMainPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String userCode = (String)session.getAttribute("myUserCode");

		UserVo user = userSelectDao.selectUser(userCode);

		HashMap map = new HashMap() ;
		map.put("userCode",userCode);

		ArrayList<ReviewVo> reviewList = userReviewDao.selectUserReview(map);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("myPageUrl", root + "user/mypage/MyReview.jsp");
		
		return moveUrl;
	}
}
