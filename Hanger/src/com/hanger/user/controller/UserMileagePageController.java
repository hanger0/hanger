package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.mileage.dao.UserMileageDao;
import com.hanger.mileage.vo.MileageVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserMileagePageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	private UserMileageDao userMileageDao;
	
	public void setUserMileageDao(UserMileageDao userMileageDao) {
		this.userMileageDao = userMileageDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/userMileagePage.hang")
	public String userTipPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> userMap = new HashMap<String, String>();
		userMap.put("myUserCode", myUserCode);
		ArrayList<MileageVo> userMileageList = userMileageDao.selectUserMileage(userMap);
		ArrayList<MileageVo> mileageList = new ArrayList<MileageVo>();
		if(userMileageList != null && userMileageList.size() >0){
			for(int i = 0; i < userMileageList.size(); i++){
				HashMap<String, String> map = new HashMap<String, String>();
				MileageVo mileage = (MileageVo)userMileageList.get(i);
				String reasonCode = mileage.getMileageReasonCode();
				String reasonDetailCode = mileage.getMileageReasonDetailCode();
				map.put("myUserCode", myUserCode);
				map.put("reasonDetailCode", reasonDetailCode);
				if(reasonCode.equals("MR004")){
					mileageList.add(userMileageDao.selectUseUserMileage(map));
				} else if(reasonCode.equals("MR002")) {
					mileageList.add(userMileageDao.selectReviewMileage(map));
				}
			}
		}
		req.setAttribute("user", user);
		req.setAttribute("mileageList", mileageList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/Mileage.jsp");
		
		return moveUrl;
	}
}
