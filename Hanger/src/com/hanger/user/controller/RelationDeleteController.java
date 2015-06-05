package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationDeleteDao;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.dao.UserSearchDao;
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationDeleteController extends BaseController {
	//
	private RelationDeleteDao relationDeleteDao;
	private RelationSearchDao relationSearchDao;
	private UserSearchDao userSearchDao;

	public void setRelationDeleteDao(RelationDeleteDao relationDeleteDao) {
		this.relationDeleteDao = relationDeleteDao;
	}
	public void setRelationSearchDao(RelationSearchDao relationSearchDao) {
		this.relationSearchDao = relationSearchDao;
	}
	public void setUserSearchDao(UserSearchDao userSearchDao) {
		this.userSearchDao = userSearchDao;
	}

	@RequestMapping("/relationFollowerDelete.hang")
	public String relationFollowerDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		ArrayList<UserVo> followerList = relationSearchDao.searchFollowerRelation(myUserCode);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
	
	@RequestMapping("/relationFollowingDelete.hang")
	public String relationFollowingDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		System.out.println(relationDeleteDao.deleteRelation(relation));
		ArrayList<UserVo> followingList = relationSearchDao.searchFollowingRelation(myUserCode);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("followingList", followingList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
	
	@RequestMapping("/relationSearchDelete.hang")
	public String relationSearchDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("userList", userList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
