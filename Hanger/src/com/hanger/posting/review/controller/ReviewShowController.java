package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.posting.review.dao.ReviewShowDao;
import com.hanger.posting.review.vo.ReviewShowVo;
import com.hanger.reply.dao.ReplyDao;

@Controller
public class ReviewShowController extends BaseController {

	private ReviewShowDao reviewShowDao;
	private ReplyDao replyDao;
	private NotificationDao notificationDao;
	
	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	public void setReviewShowDao(ReviewShowDao reviewShowDao) {
		this.reviewShowDao = reviewShowDao;
	}
	public void setReplyDao(ReplyDao replyDao) {//**
		this.replyDao = replyDao ;
	}

	@RequestMapping("/reviewShow.hang")
	public String MainReview(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		// review
		String reviewCode = (String) req.getParameter("reviewCode");
		// reply
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserName = (String)session.getAttribute("myUserName");
		String replyContent = req.getParameter("replyContent");
		String replyCode = req.getParameter("replyCode");
    	String ip = req.getRemoteAddr();
    	String checkReply = "";
    	String replyUseYn = req.getParameter("replyUseYn");
    	String yourUserCode = req.getParameter("yourUserCode");
    	if(req.getParameter("checkReply") != null){
    		checkReply = req.getParameter("checkReply");
    	}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reviewCode", reviewCode);
		map.put("userCode", myUserCode);
		List<ReviewShowVo> reviewList = reviewShowDao.getReviewShow(map);
		
		ReviewShowVo review = reviewList.get(0);
		int maxPrice = review.getItemSellPrice();
		int minPrice = review.getItemSellPrice();
		int price = 0;

		for (int i = 0; i < reviewList.size(); i++) {
			review = reviewList.get(i);
			price = review.getItemSellPrice();
			if (maxPrice < price) {
				maxPrice = price;
			}
			if (minPrice > price) {
				minPrice = price;
			}
		}
		
		HashMap<String, String> replyMap = new HashMap<String, String>();
		replyMap.put("reviewCode", reviewCode);
		replyMap.put("myUserCode", myUserCode);
		replyMap.put("myUserName", myUserName);
		replyMap.put("replyContent", replyContent);
		replyMap.put("replyCode", replyCode);
		replyMap.put("replyUseYn", replyUseYn);
		replyMap.put("ip", ip);
		replyMap.put("regId",myUserId);
		replyMap.put("regIp", ip);
		replyMap.put("updId", myUserId);
		replyMap.put("updIp", ip);
		replyMap.put("checkReply", checkReply);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();

		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", yourUserCode);
		notiMap.put("message", myUserName + "님이 뎃글을 남겻습니다.");
		notiMap.put("url", "reviewShow.hang?reviewCode="+reviewCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		if(checkReply.equals("Insert")){
			ArrayList<String> selectSeqList =replyDao.selectSeq();
			String replySeq = selectSeqList.get(0);
			replyMap.put("replySeq", replySeq);
			replyDao.insertReply(replyMap);
			ArrayList replyOne = replyDao.selectReply(replyMap);
			req.setAttribute("replyOne", replyOne);
			replyMap.remove("replySeq");
			
			notificationDao.insertNotification(notiMap);
			
			moveUrl = "reply/replyInsert";
		}
		else if(checkReply.equals("Update")) {
			String udtReplyCode = req.getParameter("replyCode");
			String udtReviewCode = req.getParameter("reviewCode");
			String udtCheckReply = req.getParameter("checkReply"); 
			String udtReplyName = req.getParameter("replyName");
			
			req.setAttribute("udtReplyCode", udtReplyCode);
			req.setAttribute("udtReviewCode", udtReviewCode);
			req.setAttribute("udtCheckReply", udtCheckReply);
			req.setAttribute("replyContent", replyContent);
			req.setAttribute("udtReplyName", udtReplyName);
			replyDao.updateReply(replyMap);
			moveUrl = "reply/replyUpdate";
		}
		else if(checkReply.equals("UpdateInsert")) {
			String udtReplyCode = req.getParameter("replyCode");
			String udtReviewCode = req.getParameter("reviewCode");
			String udtCheckReply = req.getParameter("checkReply"); 
			String udtReplyContent = req.getParameter("replyContent");
			String udtReplyName = req.getParameter("replyName");
			replyDao.updateReply(replyMap);
			
			req.setAttribute("udtReplyName", udtReplyName);
			req.setAttribute("replyContent", replyContent);
			req.setAttribute("udtReplyCode", udtReplyCode);
			req.setAttribute("udtReviewCode", udtReviewCode);
			req.setAttribute("udtCheckReply", udtCheckReply);
			
			moveUrl = "reply/replyUpdateInsert";
		}
		else if(checkReply.equals("Delete")) {
			replyDao.deleteReply(replyMap);
			notificationDao.deleteNotification(notiMap);
			moveUrl = "reply/replyDelete";
		}
		else{
			moveUrl = "posting/review/ReviewShow";			
		}
		ArrayList replyList = replyDao.selectReply(replyMap);
		req.setAttribute("replyList", replyList);

		req.setAttribute("maxPrice", maxPrice);
		req.setAttribute("minPrice", minPrice);
		req.setAttribute("reviewList", reviewList);
		
		//moveUrl = "posting/review/ReviewShow";
		return moveUrl;

	}
}
