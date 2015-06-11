package com.hanger.order.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.CartDao;
import com.hanger.order.dao.OrderBuyDao;
import com.hanger.order.vo.OrderVo;
import com.hanger.user.dao.UserSelectDao;
import com.hanger.user.vo.UserVo;

@Controller
public class OrderBuyController extends BaseController {
	//
	private OrderBuyDao orderBuyDao;
	private UserSelectDao userSelectDao;
	private CartDao cartDao;

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	public void setOrderBuyDao(OrderBuyDao orderBuyDao) {
		this.orderBuyDao = orderBuyDao;
	}
	public void setUserSelectDao(UserSelectDao userSelectDao) {
		this.userSelectDao = userSelectDao;
	}

	@RequestMapping(value="/goOrderBuyPage.hang", method=RequestMethod.POST)
	public String goOrder(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String userCode = (String)session.getAttribute("myUserCode");
		String itemCode = req.getParameter("itemCode");
		String itemMarketPrice = req.getParameter("itemMarketPrice");
		String itemPurchasePrice = req.getParameter("itemPurchasePrice");
		String itemName =req.getParameter("itemName");
		String itemPicPath = req.getParameter("itemPicPath");
		String itemPicSaveName = req.getParameter("itemPicSaveName");
		String itemSellPrice = req.getParameter("itemSellPrice");
    	String cartItemRecom = req.getParameter("cartItemRecom");
    	String itemDetailInfo = req.getParameter("itemDetailInfo");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("itemCode", itemCode);
    	map.put("userCode", userCode);
    	
    	String itemAmount = cartDao.selectAmount(map);

    	UserVo user = userSelectDao.selectUser(userCode);
    	
    	req.setAttribute("itemCode", itemCode);
    	req.setAttribute("itemMarketPrice", itemMarketPrice);
    	req.setAttribute("itemPurchasePrice", itemPurchasePrice);
    	req.setAttribute("itemName", itemName);
    	req.setAttribute("itemPicPath", itemPicPath);
    	req.setAttribute("itemPicSaveName", itemPicSaveName);
    	req.setAttribute("itemSellPrice", itemSellPrice);
    	req.setAttribute("itemAmount", itemAmount);
    	req.setAttribute("cartItemRecom", cartItemRecom);
    	req.setAttribute("itemDetailInfo", itemDetailInfo);
    	req.setAttribute("user", user);
		
		req.setAttribute("mainUrl", root + "order/BuyPage.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping(value="/orderBuy.hang", method=RequestMethod.POST)
	public String buyOrder(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		System.out.println("orderbuy.hang¿¡ µé¾î¿È");
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String ip = req.getRemoteAddr();
		String orderCode = orderBuyDao.selectSeq();
		String itemCode = req.getParameter("itemCode");
		String orderName = req.getParameter("orderName");
		String orderPhone = req.getParameter("orderPhone");
		String orderAddr1 = req.getParameter("orderAddr1");
		String orderAddr2 = req.getParameter("orderAddr2");
		String orderPostCode1 = req.getParameter("orderPostCode1");
		String orderPostCode2 = req.getParameter("orderPostCode2");
		String orderMemo = req.getParameter("orderMemo");
		String orderItemMarketPrice = req.getParameter("itemMarketPrice");
		String orderItemSellPrice = req.getParameter("itemSellPrice");
		String orderItemPurchasePrice = req.getParameter("itemPurchasePrice");
		String discountReasonCode = req.getParameter("discountReasonCode");
		String orderItemAmount = req.getParameter("orderItemAmount");
		String orderItemRecom = req.getParameter("orderItemRecom");
		String orderUsedMileage = req.getParameter("orderUsedMileage");
		String orderState = req.getParameter("orderState");

		OrderVo order = new OrderVo();
		order.setUserCode(myUserCode);
		order.setOrderCode(orderCode);
		order.setItemCode(itemCode);
		order.setOrderName(orderName);
		order.setOrderPhone(orderPhone);
		order.setOrderAddr1(orderAddr1);
		order.setOrderAddr2(orderAddr2);
		order.setOrderPostCode1(orderPostCode1);
		order.setOrderPostCode2(orderPostCode2);
		order.setOrderMemo(orderMemo);
		order.setOrderItemMarketPrice(orderItemMarketPrice);
		order.setOrderItemSellPrice(orderItemSellPrice);
		order.setOrderItemPurchasePrice(orderItemPurchasePrice);
		order.setDiscountReasonCode(discountReasonCode);
		order.setOrderItemAmount(orderItemAmount);
		order.setOrderItemRecom(orderItemRecom);
		order.setOrderUsedMileage(orderUsedMileage);
		order.setOrderState(orderState);
		order.setRegId(myUserId);
		order.setRegIp(ip);
		order.setUpdId(myUserId);
		order.setUpdIp(ip);
		
		orderBuyDao.insertOrderInfo(order);
		orderBuyDao.insertOrdering(order);

		HashMap<String, String> deleteCartMap = new HashMap<String, String>();
		deleteCartMap.put("userCode", myUserCode);
		deleteCartMap.put("itemCode", itemCode);
		
		cartDao.deleteCart(deleteCartMap);
		
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
