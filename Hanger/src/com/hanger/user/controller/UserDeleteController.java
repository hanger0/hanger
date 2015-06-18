package com.hanger.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.user.dao.UserDeleteDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserDeleteController extends BaseController {
	//
	private UserDeleteDao userDeleteDao;

	public void setUserDeleteDao(UserDeleteDao userDeleteDao) {
		this.userDeleteDao = userDeleteDao;
	}
	
	@RequestMapping(value = "/deleteUser.hang")
	public String deleteUser(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "�α��� �� �̿��� �ּ���.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String userCode = req.getParameter("uesrCode");
		String message = "";
		
		UserVo user = new UserVo();
		user.setUserCode(userCode);
		
		int resultInt = userDeleteDao.deleteUser(user);
		if(resultInt > 0 ){
			message = "�����Ϸ�Ǿ����ϴ�.";
			session.setAttribute("loginYn", "N");
			session.setAttribute("adminYn", "N");
			session.removeAttribute("myUserName");
			session.removeAttribute("myUserId");
			session.removeAttribute("myUserCode");
			session.removeAttribute("adminYn");
			session.removeAttribute("loginYn");
			session.removeAttribute("itemListForReview");
			session.invalidate();
		} else {
			message = "���������߽��ϴ�.";
		}
		
		req.setAttribute("message", message);
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
