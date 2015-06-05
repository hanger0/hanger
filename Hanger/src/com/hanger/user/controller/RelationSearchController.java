package com.hanger.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationSearchController extends BaseController {
	//
	private RelationSearchDao relationSearchDao;

	public void setRelationSearchDao(RelationSearchDao relationSearchDao) {
		this.relationSearchDao = relationSearchDao;
	}
	
	@RequestMapping("/relationFollowerSearch.hang")
	public String relationFollowerSearch(HttpServletRequest req){
		System.out.println("relationFollowerSearch");
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		ArrayList<UserVo> followerList = relationSearchDao.searchFollowerRelation(myUserCode);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
	
	@RequestMapping("/relationFollowingSearch.hang")
	public String relationFollowingSearch(HttpServletRequest req){
		System.out.println("relationFollowingSearch");
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		ArrayList<UserVo> followingList = relationSearchDao.searchFollowingRelation(myUserCode);
		
		mainUrl = "/WEB-INF/jsp/user/mypage/FlowSearch.jsp";
		System.out.println(followingList);
		req.setAttribute("followingList", followingList);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
