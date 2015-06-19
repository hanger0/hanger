package com.hanger.scrap.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.scrap.dao.ScrapDao;
import com.hanger.scrap.vo.ScrapVo;

//ajax 컨트롤입니다.
@Controller
public class ScrapController extends BaseController{
	//
	private ScrapDao scrapDao ;
	private NotificationDao notificationDao;
	
	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	public void setScrapDao(ScrapDao scrapDao) {
		this.scrapDao = scrapDao ;
	}
	
	@RequestMapping(value = "/scrap.hang", method=RequestMethod.POST)
	public String scrap(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserName = (String)session.getAttribute("myUserName");
		String postingCode = req.getParameter("postingCode");
		String yourUserCode = req.getParameter("yourUserCode");
		String ip = req.getRemoteAddr();

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("myUserCode", myUserCode);
		map.put("postingCode", postingCode);
		map.put("myUserId", myUserId);
		map.put("ip", ip);
		
		//해당 사용자가 좋아요를 눌른적이 있다면 먼저 조회
		List<ScrapVo> scrapYnList = scrapDao.selectScrapYn(map);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();

		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", yourUserCode);
		notiMap.put("message", myUserName + "님이 스크랩 했습니다.");
		notiMap.put("url", "reviewShow.hang?reviewCode="+postingCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		if(scrapYnList.size()>0 ){
			scrapDao.deleteScrap(map);
			notificationDao.deleteNotification(notiMap);
		} else {
			scrapDao.insertScrap(map);
			notificationDao.insertNotification(notiMap);
		}
		//스크랩 AJAX
		ArrayList<ScrapVo> scrapList = scrapDao.selectScrap(map);
		req.setAttribute("scrapList", scrapList);
		
		return "posting/review/Scrap" ;
	}
}
