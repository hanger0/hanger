package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.RelationSearchDao;
import com.hanger.user.dao.UserSearchDao;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.RelationVo;
import com.hanger.user.vo.UserVo;

@Controller
public class UserSearchController extends BaseController {
	//
	private UserSearchDao userSearchDao;
	private UserSelectDao userSelectDao;
	private RelationSearchDao relationSearchDao;

	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}

	public void setUserSearchDao(UserSearchDao userSearchDao) {
		this.userSearchDao = userSearchDao;
	}

	@RequestMapping("/userSearch.hang")
	public String userSearch(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}

		String myUserCode = (String) session.getAttribute("myUserCode");
		String qt = req.getParameter("qt");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);
		ArrayList<UserVo> userList = userSearchDao.searchUser(map);

		System.out.println("qt================" + qt);
		UserVo user = userSelectDao.selectUser(myUserCode);

		req.setAttribute("user", user);
		req.setAttribute("userList", userList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");
		req.setAttribute("qt", qt);

		return moveUrl;
	}

	@RequestMapping("/userMiniSearch.hang")
	public String userMiniSearch(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String) session.getAttribute("myUserCode");
		String qt = req.getParameter("searchText");

		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		map.put("qt", qt);

		ArrayList<UserVo> userList = userSearchDao.mainFriendSearch(map);

		req.setAttribute("userList", userList);
		req.setAttribute("qt", qt);

		return "user/FriendSearch";
	}

	// ///새로만든거 친구 찾기 더보기
	@RequestMapping("/SearchTheLook.hang")
	public String SearchTheLook(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String) session.getAttribute("myUserCode");

		System.out.println("더보기");
		RelationVo relation = new RelationVo();
		relation.setRelationFollower(myUserCode);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);

		ArrayList<UserVo> userList = relationSearchDao
				.searchFollowerRelation(myUserCode);

		req.setAttribute("userList", userList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/FollowSearch.jsp");

		return "moveUrl";
	}
}
