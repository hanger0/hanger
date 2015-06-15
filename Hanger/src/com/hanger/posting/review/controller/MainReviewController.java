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
		System.out.println("Review Select ����....");
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
		System.out.println("Insert ����");
		HttpSession session = req.getSession(false);
		
		ReplyVo reply = new ReplyVo();
		//log("���ö���");
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
    	//����Ʈ �ϴ°�
    	System.out.println("�������ڵ�:"+postingCode);
    	System.out.println("���ó���:"+replyContent);
    	System.out.println("�������̵�:"+userId);
    	System.out.println("�����ڵ�:"+userCode);
    	System.out.println("Reply ����....");
    	System.out.println("���� Insert:"+replyList);
    	
    	//STEP ���� ������� ������ ���� �ϱ�!
		
    	req.setAttribute("replyListSet",replyList);
		
		//return "reply/replyInsert";
    	return moveUrl;
	}
	/***************************Insert End ***********************/
}
