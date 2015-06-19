package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserTipPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/userTipPage.hang")
	public String userTipPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String userCode = (String)session.getAttribute("myUserCode");
		String yourUserCode= req.getParameter("yourUserCode");
		
		if (yourUserCode!=null&&!yourUserCode.equals("")) {
			userCode = yourUserCode;
			req.setAttribute("yourUserCode", yourUserCode);
		}
		
		UserVo user = userSelectDao.selectUser(userCode);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/UserTip.jsp");
		
		return moveUrl;
	}
}
