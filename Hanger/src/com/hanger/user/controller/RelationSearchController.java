package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationSearchController extends BaseController {
	//
	private RelationSearchDao relationSearchDao;
	private UserSelectDao userSelectDao;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setRelationSearchDao(RelationSearchDao relationSearchDao) {
		this.relationSearchDao = relationSearchDao;
	}
	
	@RequestMapping("/relationFollowerSearch.hang")
	public String relationFollowerSearch(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
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
		
		req.setAttribute("user", user);
		req.setAttribute("followingListSize", followingList.size()+"");
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationFollowingSearch.hang")
	public String relationFollowingSearch(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			map.put("yourUserCode", yourUserCode);
			followingList = relationSearchDao.selectMyFollowingRelation(map);
			followerList = relationSearchDao.selectMyFollowerRelation(map);
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		req.setAttribute("user", user);
		req.setAttribute("followingList", followingList);
		req.setAttribute("followerListSize", followerList.size()+"");
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
}
