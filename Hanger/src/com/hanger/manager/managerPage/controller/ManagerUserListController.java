package com.hanger.manager.managerPage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.manager.managerPage.dao.ManagerUserListDao;
import com.hanger.mileage.dao.UserMileageDao;
import com.hanger.mileage.vo.MileageVo;
import com.hanger.order.dao.OrderInfoDao;
import com.hanger.order.vo.OrderVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class ManagerUserListController extends BaseController{
	
	private ManagerUserListDao managerUserListDao;
	private UserSelectDao userSelectDao;
	private UserMileageDao userMileageDao;
	private OrderInfoDao orderInfoDao;
	
	public void setManagerUserListDao(ManagerUserListDao managerUserListDao){
		this.managerUserListDao = managerUserListDao;
	}
	
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}

	public void setUserMileageDao(UserMileageDao userMileageDao){
		this.userMileageDao = userMileageDao;
	}
	
	public void setOrderInfoDao(OrderInfoDao orderInfoDao){
		this.orderInfoDao = orderInfoDao;
	}
	
	@RequestMapping("/managerUserList.hang")
	public String ManagerUserList(HttpServletRequest request, HttpSession session) {
		//admin이 아닐경우 접근 허용 불가.
		String adminYn = (String) session.getAttribute("adminYn");
		String message = "";
		if(!adminYn.equals("Y")){
			message = "접근 권한이 없습니다.";
			request.setAttribute("message", message);
			request.setAttribute("mainUrl", mainUrl);
			return moveUrl ;
		}
		
		ArrayList<UserVo> userList = null;
		
		userList = managerUserListDao.selectAllUser();
		
		request.setAttribute("userList", userList);
		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root + "manager/managerPage/ManagerUserList.jsp");
		
		return moveUrl ;
	}
	
	@RequestMapping("/managerUserDetail.hang")
	public String ManagerUserDetail(HttpServletRequest request, HttpSession session){
		String adminYn = (String) session.getAttribute("adminYn");
		String message = "";
		
		//admin이 아닐경우.
		if(!adminYn.equals("Y")){
			message = "접근 권한이 없습니다.";
			request.setAttribute("message", message);
			request.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}

		String userCode = (String) request.getAttribute("myUserCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", userCode);
		
		UserVo user = userSelectDao.selectUser(userCode);
		ArrayList<MileageVo> userMileageList = userMileageDao.selectUserMileage(map);
		ArrayList<MileageVo> mileageList = new ArrayList<MileageVo>();
		if(userMileageList != null && userMileageList.size() >0){
			for(int i = 0; i < userMileageList.size(); i++){
				MileageVo mileage = (MileageVo)userMileageList.get(i);
				String reasonCode = mileage.getMileageReasonCode();
				String reasonDetailCode = mileage.getMileageReasonDetailCode();
				map.put("reasonDetailCode", reasonDetailCode);
				if(reasonCode.equals("MR004")){
					mileageList.add(userMileageDao.selectUseUserMileage(map));
				} else if(reasonCode.equals("MR002")) {
					mileageList.add(userMileageDao.selectReviewMileage(map));
				}
			}
		}
		ArrayList<OrderVo> orderList = (ArrayList<OrderVo>)orderInfoDao.selectMyOrder(map);;
		
		request.setAttribute("user", user);
		request.setAttribute("mileageList", mileageList);
		request.setAttribute("orderList", orderList);
		
		request.setAttribute("mainUrl", managerPageUrl);
		request.setAttribute("managerPageUrl", root + "manager/managerPage/ManagerUserDetail.jsp");
		
		return moveUrl;
	}
}
