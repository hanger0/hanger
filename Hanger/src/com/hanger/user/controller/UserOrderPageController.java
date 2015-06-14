package com.hanger.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.OrderInfoDao;
import com.hanger.order.vo.OrderVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class UserOrderPageController extends BaseController {
	//
	private UserSelectDao userSelectDao;
	private OrderInfoDao orderInfoDao;
	
	public void setOrderInfoDao(OrderInfoDao orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	
	@RequestMapping("/userOrderPage.hang")
	public String userTipPage(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", myUserCode);
		
		ArrayList<OrderVo> orderList = (ArrayList<OrderVo>)orderInfoDao.selectMyOrder(map);
		
		req.setAttribute("user", user);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/OrderPage.jsp");
		
		return moveUrl;
	}
}
