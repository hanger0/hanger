package com.hanger.posting.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewLikeCheckDao;
import com.hanger.posting.review.vo.ReviewLikeCheckVo;
import com.hanger.reply.dao.ReplyInsertDao;
import com.hanger.reply.dao.ReplySelectDao;
import com.hanger.reply.vo.ReplyVo;
import com.hanger.scrap.dao.ScrapDao;
import com.hanger.scrap.vo.ScrapVo;

@Controller
public class MainReviewController extends BaseController {
	//
	private ScrapDao scrapDao ;
	private ReviewLikeCheckDao reviewLikeCheckDao;
	private ReplyInsertDao replyInsertDao;
	private ReplySelectDao replySelectDao;
	
	public void setReviewLikeCheckDao(ReviewLikeCheckDao reviewLikeCheckDao) {
		this.reviewLikeCheckDao = reviewLikeCheckDao;
	}
	public void setScrapDao(ScrapDao scrapDao) {
		this.scrapDao = scrapDao;
	}
	public void setReplyInsertDao(ReplyInsertDao replyInsertDao) {
		this.replyInsertDao = replyInsertDao;
	}
	public void setReplySelectDao(ReplySelectDao replySelectDao) {
		this.replySelectDao = replySelectDao;
	}

	@RequestMapping("/mainReview.hang")
	public String MainReview(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		System.out.println("Review Select 실행....");
		String userCode = (String)session.getAttribute("myUserCode");
		String postingCode = "review";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("postingCode", postingCode);
		map.put("userCode", userCode);
    	
    	ArrayList<ReplyVo> reviewReplyList = replySelectDao.selectReply(map);
    	req.setAttribute("reviewReplyList", reviewReplyList);
    	
		ArrayList<ReviewLikeCheckVo> likeList = reviewLikeCheckDao.selectLike(map);
		ArrayList<ReviewLikeCheckVo> likeCountList = reviewLikeCheckDao.selectLikeCount(map);
		
		String likeCount = likeCountList.size() +"";
		
		ArrayList<ScrapVo> scrapList = scrapDao.selectScrap(map);
		
		req.setAttribute("scrapList",scrapList);
		req.setAttribute("postingCode", postingCode);
		req.setAttribute("likeList", likeList);
		req.setAttribute("likeCount", likeCount);
		req.setAttribute("mainUrl", root + "posting/review/MainReview.jsp");
		
		return moveUrl;
	}
	@RequestMapping(value="/reviewReplyInsert.hang", method=RequestMethod.POST)
	public String insertReply(HttpServletRequest req){
		//
		
		moveUrl = "reply/replyInsert";
		System.out.println("Insert 시작");
		HttpSession session = req.getSession(false);
		
		ReplyVo reply = new ReplyVo();
		//log("리플라이");
		String userId = (String)session.getAttribute("myUserId");
		String userCode = (String)session.getAttribute("myUserCode");
		String userName = (String)session.getAttribute("myUserName");
		//String postingCode = (String)req.getParameter("postingCode");
		String postingCode = "review";
    	String replyContent = req.getParameter("replyContent");
    	String ip = req.getRemoteAddr();
		
    	
    	reply.setUserCode(userCode);
    	reply.setPostingCode(postingCode);
    	reply.setReplyContent(replyContent);
    	reply.setRegId(userId);
    	reply.setRegIp(ip);
    	reply.setUpdId(userId);
    	reply.setUpdIp(ip);
    	reply.setUserName(userName);
    		
    	replyInsertDao.insertReply(reply);
    	
    	HashMap map = new HashMap();
    	map.put("postingCode", postingCode);
    	
		
    	ArrayList<ReplyVo> replyList = replySelectDao.selectReply(map);
    	//셀렉트 하는곳
    	System.out.println("포스팅코드:"+postingCode);
    	System.out.println("리플내용:"+replyContent);
    	System.out.println("유저아이디:"+userId);
    	System.out.println("유저코드:"+userCode);
    	System.out.println("Reply 실행....");
    	System.out.println("리플 Insert:"+replyList);
    	
    	//STEP 같은 기능으로 페이지 구분 하기!
		
    	req.setAttribute("replyListSet",replyList);
		
		//return "reply/replyInsert";
    	return moveUrl;
	}
	/***************************Insert End ***********************/
}
