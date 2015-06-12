package com.hanger.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.StringTokenizer;

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
		String itemName =req.getParameter("itemNames");
		String itemPicPath = req.getParameter("itemPicPath");
		String itemPicSaveName = req.getParameter("itemPicSaveName");
		String itemSellPrice = req.getParameter("itemSellPrice");
    	String cartItemRecom = req.getParameter("cartItemRecom");
    	String itemDetailInfo = req.getParameter("itemDetailInfo");

    	ArrayList itemCodeList = new ArrayList();
    	ArrayList itemMarketPriceList = new ArrayList();
    	ArrayList itemPurchasePriceList = new ArrayList();
    	ArrayList itemNameList = new ArrayList();
    	ArrayList itemPicPathList = new ArrayList();
    	ArrayList itemPicSaveNameList = new ArrayList();
    	ArrayList itemSellPriceList = new ArrayList();
    	ArrayList cartItemRecomList = new ArrayList();
    	ArrayList itemDetailInfoList = new ArrayList();
    	ArrayList itemAmountList = new ArrayList();
    	
    	StringTokenizer st = new StringTokenizer(itemCode, ",");
    	if(st.countTokens() > 1){
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	            String temp = st.nextToken(); // 토근을 temp 변수에 저장
	            itemCodeList.add(temp);
	        }
	        st = new StringTokenizer(itemMarketPrice, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemMarketPriceList.add(temp);
	        }
	        st = new StringTokenizer(itemPurchasePrice, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemPurchasePriceList.add(temp);
	        }
	        st = new StringTokenizer(itemName, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemNameList.add(temp);
	        }
	        st = new StringTokenizer(itemPicPath, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemPicPathList.add(temp);
	        }
	        st = new StringTokenizer(itemPicSaveName, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemPicSaveNameList.add(temp);
	        }
	        st = new StringTokenizer(itemSellPrice, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemSellPriceList.add(temp);
	        }
	        st = new StringTokenizer(cartItemRecom, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	cartItemRecomList.add(temp);
	        }
	        st = new StringTokenizer(itemDetailInfo, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemDetailInfoList.add(temp);
	        }
    	} else {
    		itemCodeList.add(itemCode);
        	itemMarketPriceList.add(itemMarketPrice);
        	itemPurchasePriceList.add(itemPurchasePrice);
        	itemNameList.add(itemName);
        	itemPicPathList.add(itemPicPath);
        	itemPicSaveNameList.add(itemPicSaveName);
        	itemSellPriceList.add(itemSellPrice);
        	cartItemRecomList.add(cartItemRecom);
        	itemDetailInfoList.add(itemDetailInfo);
    	}
    	
        for(int i = 0; i < itemCodeList.size(); i++){
        	String icode = (String)itemCodeList.get(0);

        	HashMap<String, String> map = new HashMap<String, String>();
        	map.put("itemCode", icode);
        	map.put("userCode", userCode);
        	
        	String itemAmount = cartDao.selectAmount(map);
        	
        	itemAmountList.add(itemAmount);
        }
        
        ArrayList cartList = new ArrayList();
        for(int i = 0; i < itemCodeList.size() ; i++){
        	Hashtable table = new Hashtable();
        	
        	table.put("itemCode", itemCodeList.get(i));
        	if(itemMarketPriceList != null && itemMarketPriceList.size() >0){
        		table.put("itemMarketPrice", itemMarketPriceList.get(i));
        	}
        	if(itemPurchasePriceList != null && itemPurchasePriceList.size() > 0){
        		table.put("itemPurchasePrice", itemPurchasePriceList.get(i));
        	}
			table.put("itemName", itemNameList.get(i));
			table.put("itemPicPath", itemPicPathList.get(i));
			table.put("itemPicSaveName", itemPicSaveNameList.get(i));
			table.put("itemSellPrice", itemSellPriceList.get(i));
			table.put("cartItemRecom", cartItemRecomList.get(i));
			table.put("itemDetailInfo", itemDetailInfoList.get(i));
			table.put("itemAmount", itemAmountList.get(i));
        	
			cartList.add(table);
        }
    	
    	UserVo user = userSelectDao.selectUser(userCode);
    	
    	req.setAttribute("cartList", cartList);
    	req.setAttribute("user", user);
		
		req.setAttribute("mainUrl", root + "order/BuyPage.jsp");
		
		return moveUrl;
	}
	
	@RequestMapping(value="/orderBuy.hang", method=RequestMethod.POST)
	public String buyOrder(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		System.out.println("orderbuy.hang에 들어옴");
		
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
