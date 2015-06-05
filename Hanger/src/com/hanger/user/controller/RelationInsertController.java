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
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationInsertController extends BaseController {
	//
	private RelationInsertDao relationInsertDao;
	private RelationSearchDao relationSearchDao;
	private UserSearchDao userSearchDao;

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
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		String relationFollowing = req.getParameter("userCode");
		relation.setRelationFollowing(relationFollowing);
		
		relationInsertDao.insertRelation(relation);
		
		ArrayList<UserVo> followerList = relationSearchDao.searchFollowerRelation(myUserCode);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
	
	@RequestMapping("/relationSearchInsert.hang")
	public String insertSearchRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String qt = (String)req.getAttribute("qt");
		System.out.println(qt + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		String relationFollowing = req.getParameter("userCode");
		relation.setRelationFollowing(relationFollowing);
		
		relationInsertDao.insertRelation(relation);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("userList", userList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
