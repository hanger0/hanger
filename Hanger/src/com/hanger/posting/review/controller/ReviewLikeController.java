package com.hanger.posting.review.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.posting.review.dao.ReviewLikeCheckDao;
import com.hanger.posting.review.vo.ReviewLikeCheckVo;

@Controller
public class ReviewLikeController extends BaseController {

	private ReviewLikeCheckDao reviewLikeCheckDao;
	private NotificationDao notificationDao;
	
	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	public void setReviewLikeCheckDao(ReviewLikeCheckDao reviewLikeCheckDao) {
		this.reviewLikeCheckDao = reviewLikeCheckDao;
	}

	@RequestMapping(value="/reviewLikeCheck.hang",method=RequestMethod.POST )
	public String reviewLikeCheck(HttpServletRequest req)
	{
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "�α��� �� �̿��� �ּ���.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		//������� ���̵� �����´�.
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserName = (String)session.getAttribute("myUserName");
		String postingCode = req.getParameter("postingCode");
		String yourUserCode = req.getParameter("yourUserCode");
		String ip = req.getRemoteAddr();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userCode", myUserCode);
		map.put("postingCode", postingCode);
		map.put("userId", myUserId);
		map.put("userIp", ip);
		
		//�ش� ����ڰ� ���ƿ並 �������� �ִٸ� ���� ��ȸ
		List<ReviewLikeCheckVo> likeList = reviewLikeCheckDao.selectLike(map);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();

		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", yourUserCode);
		notiMap.put("message", myUserName + "���� ���ƿ並 �������ϴ�.");
		notiMap.put("url", "reviewShow.hang?reviewCode="+postingCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		//��ȸ�� ���� 0�̸� insert �ؾ���.
		if(likeList.size() == 0 ) {
			reviewLikeCheckDao.insertLike(map);	
			notificationDao.insertNotification(notiMap);
		} else {
			reviewLikeCheckDao.deleteLike(map);
			notificationDao.deleteNotification(notiMap);
		}
		
		List<ReviewLikeCheckVo> likeCnt = reviewLikeCheckDao.selectLikeCount(map);
	
		req.setAttribute("likeCnt", likeCnt.size() + "");
		return "posting/review/ReviewLikeCheck";
	}
}
