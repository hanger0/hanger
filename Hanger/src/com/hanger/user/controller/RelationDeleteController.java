package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationDeleteDao;
import com.hanger.user.vo.RelationVo;

@Controller
public class RelationDeleteController extends BaseController {
	//
	private RelationDeleteDao relationDeleteDao;

	public void setRelationDeleteDao(RelationDeleteDao relationDeleteDao) {
		this.relationDeleteDao = relationDeleteDao;
	}
	
	public String relationDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		return moveUrl;
	}
}
