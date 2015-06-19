package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.posting.review.dao.ReviewListDao;
import com.hanger.posting.review.vo.ReviewVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserMyPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	private ReviewListDao reviewListDao;
	private NotificationDao notificationDao;
	
	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setReviewListDao(ReviewListDao reviewListDao) {
		this.reviewListDao = reviewListDao;
	}

	@RequestMapping("/myPage.hang")
	public String userMainPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
			
		String myUserCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");

		UserVo user = userSelectDao.selectUser(myUserCode);

		HashMap<String, String> userCodeMap = new HashMap<String, String>() ;
		userCodeMap.put("yourUserCode",myUserCode);
		
		HashMap<String, String> notificationMap = new HashMap<String, String>() ;
		notificationMap.put("", "");
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			userCodeMap.put("yourUserCode",yourUserCode);
			user = userSelectDao.selectUser(yourUserCode);
			req.setAttribute("yourUserCode", yourUserCode);
			//notificationDao.updateNotificationReadYn(notificationMap);
		}
		
		ArrayList<ReviewVo> reviewList = reviewListDao.selectReview(userCodeMap);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("myPageUrl", root + "user/mypage/MyReview.jsp");
		
		return moveUrl;
	}
}
