package com.hanger.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.OrderBuyDao;
import com.hanger.order.vo.OrderVo;

@Controller
public class OrderBuyController extends BaseController {
	//
	private OrderBuyDao orderBuyDao;

	public void setOrderBuyDao(OrderBuyDao orderBuyDao) {
		this.orderBuyDao = orderBuyDao;
	}
	
	@RequestMapping("/buyOrder.hang")
	public String buyOrder(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String ip = req.getRemoteAddr();
		String orderCode = orderBuyDao.selectSeq();
		String itemCode = req.getParameter("itemCode");
		String orderItemAmount = req.getParameter("orderItemAmount");
		String orderItemVerify = req.getParameter("orderItemVerify");
		String orderItemRecom = req.getParameter("orderItemRecom");
		String orderUsedMileage = req.getParameter("orderUsedMileage");
		String orderState = req.getParameter("orderState");

		OrderVo order = new OrderVo();
		order.setUserCode(myUserCode);
		order.setOrderCode(orderCode);
		order.setItemCode(itemCode);
		order.setOrderItemAmount(orderItemAmount);
		order.setOrderItemVerify(orderItemVerify);
		order.setOrderItemRecom(orderItemRecom);
		order.setOrderUsedMileage(orderUsedMileage);
		order.setOrderState(orderState);
		order.setRegId(myUserId);
		order.setRegIp(ip);
		order.setUpdId(myUserId);
		order.setUpdIp(ip);

		orderBuyDao.insertOrderInfo(order);
		orderBuyDao.insertOrdering(order);
		
		return moveUrl;
	}
}
