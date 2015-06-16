package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewListDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserMyPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	private ReviewListDao reviewListDao ;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setReviewListDao(ReviewListDao reviewListDao) {
		this.reviewListDao = reviewListDao;
	}


	@RequestMapping("/myPage.hang")
	public String userMainPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");

		UserVo user = userSelectDao.selectUser(myUserCode);

		HashMap userCodeMap = new HashMap() ;
		
		userCodeMap.put("yourUserCode",myUserCode);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			userCodeMap.put("yourUserCode",yourUserCode);
		}
		
		ArrayList reviewList = reviewListDao.selectReview(userCodeMap);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("myPageUrl", root + "user/mypage/MyReview.jsp");
		
		return moveUrl;
	}
}
