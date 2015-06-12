package com.hanger.order.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.OrderDecideDao;

@Controller
public class OrderDecideController extends BaseController {
	//
	private OrderDecideDao orderDecideDao;

	public void setOrderDecideDao(OrderDecideDao orderDecideDao) {
		this.orderDecideDao = orderDecideDao;
	}
	
	@RequestMapping("/orderDecide.hang")
	public String orderDecide(HttpServletRequest req){
		//
		String orderInfoCode = req.getParameter("orderInfoCode");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderInfoCode", orderInfoCode);
		
		orderDecideDao.orderDecide(map);
		
		return moveUrl;
	}
}
