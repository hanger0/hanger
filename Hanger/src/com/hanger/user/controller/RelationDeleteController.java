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
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class RelationDeleteController extends BaseController {
	//
	private RelationDeleteDao relationDeleteDao;
	private RelationSearchDao relationSearchDao;
	private UserSearchDao userSearchDao;
	private UserSelectDao userSelectDao;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
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
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			map.put("yourUserCode", yourUserCode);
			followerList = relationSearchDao.selectMyFollowerRelation(map);
			followingList = relationSearchDao.selectMyFollowingRelation(map);
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(userCode);
		
		req.setAttribute("user", user);
		req.setAttribute("followingListSize", followingList.size()+"");
		req.setAttribute("followerList", followerList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationFollowingDelete.hang")
	public String relationFollowingDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("yourUserCode", myUserCode);
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			myUserCode = yourUserCode;
			map.put("yourUserCode", yourUserCode);
			followingList = relationSearchDao.selectMyFollowingRelation(map);
			followerList = relationSearchDao.selectMyFollowerRelation(map);
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(userCode);
		
		req.setAttribute("user", user);
		req.setAttribute("followingList", followingList);
		req.setAttribute("followerListSize", followerList.size()+"");
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping("/relationSearchDelete.hang")
	public String relationSearchDelete(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String userCode = req.getParameter("userCode");
		String qt = req.getParameter("deleteQt");
		
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);
		relation.setRelationFollowing(userCode);
		
		relationDeleteDao.deleteRelation(relation);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);
		map.put("yourUserCode", myUserCode);
		
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);
		
		ArrayList<UserVo> followingList = relationSearchDao.selectMyFollowingRelation(map);
		ArrayList<UserVo> followerList = relationSearchDao.selectMyFollowerRelation(map);
		
		UserVo user = userSelectDao.selectUser(userCode);
		
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
