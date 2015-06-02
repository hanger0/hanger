package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationInsertDao;
import com.hanger.user.vo.RelationVo;

@Controller
public class RelationInsertController extends BaseController {
	//
	private RelationInsertDao relationInsertDao;

	public void setRelationInsertDao(RelationInsertDao relationInsertDao) {
		this.relationInsertDao = relationInsertDao;
	}
	
	@RequestMapping("/relationInsert.hang")
	public String insertRelation(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		String relationFollowing = req.getParameter("userCode");
		relation.setRelationFollowing(relationFollowing );
		
		relationInsertDao.insertRelation(relation);
		
		return moveUrl;
	}
}
