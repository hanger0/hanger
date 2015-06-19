package com.hanger.notification.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.notification.vo.NotificationVo;

@Controller
public class NotificationController extends BaseController {
	//
	private NotificationDao notificationDao;

	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	
	@RequestMapping("/searchNotification.hang")
	public String searchNotification(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		ArrayList<NotificationVo> notificationList = (ArrayList<NotificationVo>)notificationDao.selectNotification(myUserCode);
		
		req.setAttribute("notificationList", notificationList);
		
		return "notification/Notification";
	}
	
	@RequestMapping("/searchNotificationList.hang")
	public String searchNotificationList(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		ArrayList<NotificationVo> notificationList = (ArrayList<NotificationVo>)notificationDao.selectNotification(myUserCode);
		
		req.setAttribute("notificationList", notificationList);
		req.setAttribute("mainUrl", root + "notification/NotificationList.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/updateNotification.hang")
	public String updateNotification(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		System.out.println("updateNotificationController 들어옴");
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String fromUserCode = req.getParameter("fromUserCode");
		String url = req.getParameter("url");
		String id = (String)session.getAttribute("myUserId");
		String ip = req.getRemoteAddr();
		
		HashMap<String, String> notificationMap = new HashMap<String, String>();
		notificationMap.put("id", id);
		notificationMap.put("ip", ip);
		notificationMap.put("myUserCode", myUserCode);
		notificationMap.put("fromUserCode", fromUserCode);
		notificationMap.put("url", url);
		
		notificationDao.updateNotificationReadYn(notificationMap);
		
		return "notification/UpdateNotification";
	}
}
