package com.hanger.posting.review.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.posting.review.dao.ReviewLikeCheckDao;
import com.hanger.posting.review.vo.ReviewLikeCheckVo;

@Controller
public class ReviewLikeController extends BaseController {

	private ReviewLikeCheckDao reviewLikeCheckDao;

	public void setReviewLikeCheckDao(ReviewLikeCheckDao reviewLikeCheckDao) {
		this.reviewLikeCheckDao = reviewLikeCheckDao;
	}

	@RequestMapping(value="/reviewLikeCheck.hang",method=RequestMethod.POST )
	public String reviewLikeCheck(HttpServletRequest req)
	{
		moveUrl = "posting/review/ReviewLikeCheck";
		
		//사용자의 아이디를 가져온다.
		HttpSession session = req.getSession();
		
		String userId = (String)session.getAttribute("myUserId");
		String userCode = (String)session.getAttribute("myUserCode");
		
		String postingCode = req.getParameter("postingCode");
		String ip = req.getRemoteAddr();
		
		HashMap map = new HashMap();
		
		map.put("userCode", userCode);
		map.put("postingCode", postingCode);
		map.put("userId", userId);
		map.put("userIp", ip);
		
		
	
		//해당 사용자가 좋아요를 눌른적이 있다면 먼저 조회
		List<ReviewLikeCheckVo> likeList = reviewLikeCheckDao.selectLike(map);
		
		//조회된 값이 0이면 insert 해야함.
		if(likeList.size() == 0 ) {
			likeList = reviewLikeCheckDao.insertLike(map);	
		}
		
		/*
		List<ReviewLikeCheckVo> likeCnt = reviewLikeCheckDao.selectLikeCount(map);
	
		req.setAttribute("postingCode", postingCode);
		req.setAttribute("likeCnt", likeCnt);
		*/
		return moveUrl;
	}
	
	@RequestMapping(value="reviewLikeCancel.hang", method=RequestMethod.POST)
	public String reviewLikeCancel(HttpServletRequest req)
	{
		System.out.println("삭제하면 여길로온다");
		moveUrl = "posting/review/ReviewLikeCheck";
		
		//사용자의 아이디를 가져온다.
		HttpSession session = req.getSession();
		String userCode = (String)session.getAttribute("myUserCode");
		String postingCode = req.getParameter("postingCode");
		
		HashMap map = new HashMap();
		map.put("userCode", userCode);
		map.put("postingCode", postingCode);
		
		int likeList = reviewLikeCheckDao.deleteLike(map);
		return moveUrl;
	}
}
