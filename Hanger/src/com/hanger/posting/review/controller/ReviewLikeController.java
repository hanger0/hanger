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
		//������� ���̵� �����´�.
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
		
		//�ش� ����ڰ� ���ƿ並 �������� �ִٸ� ���� ��ȸ
		List<ReviewLikeCheckVo> likeList = reviewLikeCheckDao.selectLike(map);
		
		//��ȸ�� ���� 0�̸� insert �ؾ���.
		if(likeList.size() == 0 ) {
			reviewLikeCheckDao.insertLike(map);	
		} else {
			reviewLikeCheckDao.deleteLike(map);
		}
		
		List<ReviewLikeCheckVo> likeCnt = reviewLikeCheckDao.selectLikeCount(map);
	
		req.setAttribute("likeCnt", likeCnt.size() + "");
		return moveUrl;
	}
}
