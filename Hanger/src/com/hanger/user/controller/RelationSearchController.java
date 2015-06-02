package com.hanger.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationSearchController extends BaseController {
	//
	private RelationSearchDao relationSearchDao;

	public void setRelationSearchDao(RelationSearchDao relationSearchDao) {
		this.relationSearchDao = relationSearchDao;
	}
	
	@RequestMapping("/relationSearch.hang")
	public String relationSearch(HttpServletRequest req){
		HttpSession session = req.getSession();
		RelationVo relation = new RelationVo();
		relation.setRelationFollower((String)session.getAttribute("myUserCode"));
		ArrayList<UserVo> userList = relationSearchDao.searchRelation(relation);
		
		req.setAttribute("userList", userList);
		
		return moveUrl;
	}
}
