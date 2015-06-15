package com.hanger.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.OrderDecideDao;
import com.hanger.order.dao.OrderInfoDao;
import com.hanger.order.vo.OrderVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class OrderDecideController extends BaseController {
	//
	private OrderDecideDao orderDecideDao;
	private UserSelectDao userSelectDao;
	private OrderInfoDao orderInfoDao;
	
	public void setOrderInfoDao(OrderInfoDao orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}
	public void setOrderDecideDao(OrderDecideDao orderDecideDao) {
		this.orderDecideDao = orderDecideDao;
	}
	
	@RequestMapping("/orderDecide.hang")
	public String orderDecide(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		String orderInfoCode = req.getParameter("orderInfoCode");
		
		HashMap<String, String> orderinfoMap = new HashMap<String, String>();
		orderinfoMap.put("orderInfoCode", orderInfoCode);
		
		orderDecideDao.orderDecide(orderinfoMap);
		
		UserVo user = userSelectDao.selectUser(myUserCode);
		
		HashMap<String, String> userMap = new HashMap<String, String>();
		userMap.put("myUserCode", myUserCode);
		
		ArrayList<OrderVo> orderList = (ArrayList<OrderVo>)orderInfoDao.selectMyOrder(userMap);
		
		req.setAttribute("user", user);
		req.setAttribute("orderList", orderList);
		req.setAttribute("mainUrl", myPageUrl);
		req.setAttribute("myPageUrl", root + "user/mypage/OrderPage.jsp");
		
		return moveUrl;
	}
}
