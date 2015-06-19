package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.notification.dao.NotificationDao;
import com.hanger.user.dao.RelationInsertDao;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.dao.UserSearchDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationInsertController extends BaseController {
	//
	private RelationInsertDao relationInsertDao;
	private RelationSearchDao relationSearchDao;
	private UserSearchDao userSearchDao;
	private UserSelectDao userSelectDao;
	private NotificationDao notificationDao;
	
	public void setNotificationDao(NotificationDao notificationDao) {
		this.notificationDao = notificationDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setRelationInsertDao(RelationInsertDao relationInsertDao) {
		this.relationInsertDao = relationInsertDao;
	}
	public void setRelationSearchDao(RelationSearchDao relationSearchDao) {
		this.relationSearchDao = relationSearchDao;
	}
	public void setUserSearchDao(UserSearchDao userSearchDao) {
		this.userSearchDao = userSearchDao;
	}

	@RequestMapping("/relationFollowerInsert.hang")
	public String insertFollowerRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserName = (String)session.getAttribute("myUserName");
		String ip = req.getRemoteAddr();
		String userCode = req.getParameter("userCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
		HashMap<String, String> relationMap = new HashMap<String, String>();
		relationMap.put("myUserCode", myUserCode);
		relationMap.put("myUserId", myUserId);
		relationMap.put("ip", ip);
		relationMap.put("userCode", userCode);
		
		relationInsertDao.insertRelation(relationMap);
		
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			map.put("yourUserCode", yourUserCode);
			followerList = relationSearchDao.selectMyFollowerRelation(map);
			followingList = relationSearchDao.selectMyFollowingRelation(map);
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();
		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", userCode);
		notiMap.put("message", myUserName + "님이 팔로우 하셨습니다.");
		notiMap.put("url", "myPage.hang?yourUserCode="+myUserCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		notificationDao.insertNotification(notiMap);
		
		req.setAttribute("user", user);
		req.setAttribute("followingListSize", followingList.size()+"");
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationFolloingInsert.hang")
	public String insertFollowingRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserName = (String)session.getAttribute("myUserName");
		String ip = req.getRemoteAddr();
		String userCode = req.getParameter("userCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
		HashMap<String, String> relationMap = new HashMap<String, String>();
		relationMap.put("myUserCode", myUserCode);
		relationMap.put("myUserId", myUserId);
		relationMap.put("ip", ip);
		relationMap.put("userCode", userCode);
		
		relationInsertDao.insertRelation(relationMap);
		
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			map.put("yourUserCode", yourUserCode);
			followerList = relationSearchDao.selectMyFollowerRelation(map);
			followingList = relationSearchDao.selectMyFollowingRelation(map);
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();
		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", userCode);
		notiMap.put("message", myUserName + "님이 팔로우 하셨습니다.");
		notiMap.put("url", "myPage.hang?yourUserCode="+myUserCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		notificationDao.insertNotification(notiMap);
		
		req.setAttribute("user", user);
		req.setAttribute("followingListSize", followingList);
		req.setAttribute("followerList", followerList.size()+"");
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationSearchInsert.hang")
	public String insertSearchRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String myUserName = (String)session.getAttribute("myUserName");
		String ip = req.getRemoteAddr();
		String userCode = req.getParameter("userCode");
		String qt = req.getParameter("insertQt");
		
		HashMap<String, String> relationMap = new HashMap<String, String>();
		relationMap.put("myUserCode", myUserCode);
		relationMap.put("myUserId", myUserId);
		relationMap.put("ip", ip);
		relationMap.put("userCode", userCode);
		
		relationInsertDao.insertRelation(relationMap);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);
		map.put("yourUserCode", myUserCode);
		
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);

		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> notiMap = new HashMap<String, String>();
		notiMap.put("fromUserCode", myUserCode);
		notiMap.put("toUserCode", userCode);
		notiMap.put("message", myUserName + "님이 팔로우 하셨습니다.");
		notiMap.put("url", "myPage.hang?yourUserCode="+myUserCode);
		notiMap.put("id", myUserId);
		notiMap.put("ip", ip);
		
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		
		notificationDao.insertNotification(notiMap);
		
		req.setAttribute("user", user);
		req.setAttribute("userList", userList);
		req.setAttribute("followingListSize", followingList.size()+"");
		req.setAttribute("followerListSize", followerList.size()+"");
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		req.setAttribute("qt", qt);
		
		return moveUrl;
	}
}
