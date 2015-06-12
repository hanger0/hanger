package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationInsertDao;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.dao.UserSearchDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationInsertController extends BaseController {
	//
	private RelationInsertDao relationInsertDao;
	private RelationSearchDao relationSearchDao;
	private UserSearchDao userSearchDao;
	private UserSelectDao userSelectDao;
	
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
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String ip = req.getRemoteAddr();
		String userCode = req.getParameter("userCode");
		
		HashMap relationMap = new HashMap();
		relationMap.put("myUserCode", myUserCode);
		relationMap.put("myUserId", myUserId);
		relationMap.put("ip", ip);
		relationMap.put("userCode", userCode);
		
		relationInsertDao.insertRelation(relationMap);
		
		ArrayList<UserVo> followerList = relationSearchDao.searchFollowerRelation(myUserCode);
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		req.setAttribute("user", user);
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FlowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationSearchInsert.hang")
	public String insertSearchRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String ip = req.getRemoteAddr();
		String userCode = req.getParameter("userCode");
		String qt = req.getParameter("insertQt");
		
		HashMap relationMap = new HashMap();
		relationMap.put("myUserCode", myUserCode);
		relationMap.put("myUserId", myUserId);
		relationMap.put("ip", ip);
		relationMap.put("userCode", userCode);
		
		relationInsertDao.insertRelation(relationMap);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);
		
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);

		UserVo user = userSelectDao.selectUser(userCode);
		
		req.setAttribute("user", user);
		req.setAttribute("userList", userList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FlowSearch.jsp");
		req.setAttribute("qt", qt);
		
		return moveUrl;
	}
}
