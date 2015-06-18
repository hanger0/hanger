package com.hanger.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemListForReviewDao;
import com.hanger.item.vo.ItemListForReviewVo;
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
	private ItemListForReviewDao itemListForReviewDao;
	
	public void setOrderInfoDao(OrderInfoDao orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	public void setItemListForReviewDao(ItemListForReviewDao itemListForReviewDao) {
		this.itemListForReviewDao = itemListForReviewDao;
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
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String orderInfoCode = req.getParameter("orderInfoCode");
		
		HashMap<String, String> orderinfoMap = new HashMap<String, String>();
		orderinfoMap.put("orderInfoCode", orderInfoCode);
		
		int ok = orderDecideDao.orderDecide(orderinfoMap);
		if(ok>0)
		{
			ArrayList<ItemListForReviewVo> itemListForReview = (ArrayList<ItemListForReviewVo>)itemListForReviewDao.getItemListForReview(myUserCode);
			session.setAttribute("itemListForReview", itemListForReview);
		}
		
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
