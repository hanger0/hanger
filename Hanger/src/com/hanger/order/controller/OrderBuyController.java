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
import com.hanger.mileage.dao.UseMileageDao;
import com.hanger.mileage.dao.UserMileageDao;
import com.hanger.mileage.vo.MileageVo;
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
	private UserMileageDao userMileageDao;
	private UseMileageDao useMileageDao;

	public void setUseMileageDao(UseMileageDao useMileageDao) {
		this.useMileageDao = useMileageDao;
	}
	public void setUserMileageDao(UserMileageDao userMileageDao) {
		this.userMileageDao = userMileageDao;
	}
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
		String myUserCode = (String)session.getAttribute("myUserCode");
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
        	String icode = (String)itemCodeList.get(i);

        	HashMap<String, String> map = new HashMap<String, String>();
        	map.put("itemCode", icode);
        	map.put("userCode", myUserCode);
        	
        	String itemAmount = cartDao.selectAmount(map);
        	
        	itemAmountList.add(itemAmount);
        }
        
        ArrayList cartList = new ArrayList();
        for(int i = 0; i < itemCodeList.size() ; i++){
        	Hashtable table = new Hashtable();
        	
        	table.put("itemCode", itemCodeList.get(i));
    		table.put("itemMarketPrice", itemMarketPriceList.get(i));
    		table.put("itemPurchasePrice", itemPurchasePriceList.get(i));
			table.put("itemName", itemNameList.get(i));
			table.put("itemPicPath", itemPicPathList.get(i));
			table.put("itemPicSaveName", itemPicSaveNameList.get(i));
			table.put("itemSellPrice", itemSellPriceList.get(i));
			table.put("cartItemRecom", cartItemRecomList.get(i));
			table.put("itemDetailInfo", itemDetailInfoList.get(i));
			table.put("itemAmount", itemAmountList.get(i));
        	
			cartList.add(table);
        }
    	
    	UserVo user = userSelectDao.selectUser(myUserCode);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("myUserCode", myUserCode);
    	
    	ArrayList<MileageVo> mileageList = (ArrayList<MileageVo>)userMileageDao.selectUserMileage(map);
    	int mileageAmount = 0;
    	
    	if(mileageList != null && mileageList.size() > 0){
    		for(int i = 0; i < mileageList.size(); i++){
    			MileageVo mileage = mileageList.get(i);
    			String reason = mileage.getMileageReasonCode();
    			int amount = Integer.parseInt(mileage.getMileageAmount());
    			if(reason.equals("MR004")){
    				mileageAmount -= amount;
    			} else {
    				mileageAmount += amount;
    			}
    		}
    	}
    	
    	req.setAttribute("cartList", cartList);
    	req.setAttribute("user", user);
    	req.setAttribute("mileageAmount", mileageAmount + "");
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
		String orderName = req.getParameter("userName");
		String orderPhone = req.getParameter("userPhone");
		String orderAddr1 = req.getParameter("addr1");
		String orderAddr2 = req.getParameter("addr2");
		String orderPostCode1 = req.getParameter("zipCode1");
		String orderPostCode2 = req.getParameter("zipCode2");
		String orderMemo = req.getParameter("orderMemo");
		String orderUsedMileage = req.getParameter("orderUsedMileage");
		String orderState = req.getParameter("orderState");
		
		String itemCodes = req.getParameter("itemCode");
		String orderItemMarketPrices = req.getParameter("itemMarketPrice");
		String orderItemSellPrices = req.getParameter("itemSellPrice");
		String orderItemPurchasePrices = req.getParameter("itemPurchasePrice");
		String discountReasonCodes = req.getParameter("discountReasonCode");
		String orderItemRecoms = req.getParameter("orderItemRecom");
		String orderItemAmounts = req.getParameter("orderItemAmount");
		
		ArrayList itemCodeList = new ArrayList();
    	ArrayList itemMarketPriceList = new ArrayList();
    	ArrayList itemPurchasePriceList = new ArrayList();
    	ArrayList itemSellPriceList = new ArrayList();
    	ArrayList cartItemRecomList = new ArrayList();
    	ArrayList itemAmountList = new ArrayList();
    	ArrayList discountReasonCodeList = new ArrayList();
    	
    	StringTokenizer st = new StringTokenizer(itemCodes, ",");
    	if(st.countTokens() > 1){
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	            String temp = st.nextToken(); // 토근을 temp 변수에 저장
	            itemCodeList.add(temp);
	        }
	        st = new StringTokenizer(orderItemMarketPrices, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemMarketPriceList.add(temp);
	        }
	        st = new StringTokenizer(orderItemPurchasePrices, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemPurchasePriceList.add(temp);
	        }
	        st = new StringTokenizer(orderItemSellPrices, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemSellPriceList.add(temp);
	        }
	        st = new StringTokenizer(orderItemRecoms, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	cartItemRecomList.add(temp);
	        }
	        st = new StringTokenizer(orderItemAmounts, ",");
	        while(st.hasMoreTokens()){   //토근이 있는동안 while문이 실행됨
	        	String temp = st.nextToken(); // 토근을 temp 변수에 저장
	        	itemAmountList.add(temp);
	        }
	        for(int i = 0; i < itemCodeList.size(); i++){
	        	String itemCode = (String)itemCodeList.get(i);
	        	String orderItemMarketPrice = (String)itemMarketPriceList.get(i);
	        	String orderItemPurchasePrice = (String)itemPurchasePriceList.get(i);
	        	String orderItemSellPrice = (String)itemSellPriceList.get(i);
	        	String orderItemRecom = "";
	        	if(cartItemRecomList != null && cartItemRecomList.size() > 0){
	        		orderItemRecom = (String)cartItemRecomList.get(i);
	        	}
	        	String orderItemAmount = (String)itemAmountList.get(i);
	        	String discountReasonCode = "";
	        	if(discountReasonCodeList != null && discountReasonCodeList.size() > 0){
	        		discountReasonCode = (String)discountReasonCodeList.get(i);
	        	}
		        OrderVo orderInfo = new OrderVo();
		        orderInfo.setOrderCode(orderCode);
		    	orderInfo.setItemCode(itemCode);
		    	orderInfo.setOrderItemMarketPrice(orderItemMarketPrice);
		    	orderInfo.setOrderItemSellPrice(orderItemSellPrice);
		    	orderInfo.setOrderItemPurchasePrice(orderItemPurchasePrice);
		    	orderInfo.setDiscountReasonCode(discountReasonCode);
		    	orderInfo.setOrderItemAmount(orderItemAmount);
		    	orderInfo.setOrderItemRecom(orderItemRecom);
		    	
		    	orderBuyDao.insertOrderInfo(orderInfo);
		    	
		    	HashMap<String, String> deleteCartMap = new HashMap<String, String>();
				deleteCartMap.put("userCode", myUserCode);
				deleteCartMap.put("itemCode", itemCode);

				cartDao.deleteCart(deleteCartMap);
	        }
    	} else {
        	OrderVo orderInfo = new OrderVo();
        	orderInfo.setOrderCode(orderCode);
        	orderInfo.setItemCode(itemCodes);
        	orderInfo.setOrderItemMarketPrice(orderItemMarketPrices);
        	orderInfo.setOrderItemSellPrice(orderItemSellPrices);
        	orderInfo.setOrderItemPurchasePrice(orderItemPurchasePrices);
        	orderInfo.setDiscountReasonCode(discountReasonCodes);
        	orderInfo.setOrderItemAmount(orderItemAmounts);
        	orderInfo.setOrderItemRecom(orderItemRecoms);
        	
        	orderBuyDao.insertOrderInfo(orderInfo);
        	
        	HashMap<String, String> deleteCartMap = new HashMap<String, String>();
    		deleteCartMap.put("userCode", myUserCode);
    		deleteCartMap.put("itemCode", itemCodes);
    		
    		cartDao.deleteCart(deleteCartMap);
    	}

		OrderVo ordering = new OrderVo();
		ordering.setUserCode(myUserCode);
		ordering.setOrderCode(orderCode);
		ordering.setOrderRecipientName(orderName);
		ordering.setOrderRecipientPhone(orderPhone);
		ordering.setOrderRecipientAddr1(orderAddr1);
		ordering.setOrderRecipientAddr2(orderAddr2);
		ordering.setOrderRecipientPostCode1(orderPostCode1);
		ordering.setOrderRecipientPostCode2(orderPostCode2);
		ordering.setOrderMemo(orderMemo);
		ordering.setOrderUsedMileage(orderUsedMileage);
		ordering.setOrderState(orderState);
		ordering.setRegId(myUserId);
		ordering.setRegIp(ip);
		ordering.setUpdId(myUserId);
		ordering.setUpdIp(ip);
		
		orderBuyDao.insertOrdering(ordering);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mileageOwnderCode", myUserCode);
		map.put("mileageReasonCode", "");
		map.put("mileageReasonDetailCode", "");
		map.put("mileageAmount", "");
		map.put("regId", myUserId);
		map.put("regIp", ip);
		map.put("updId", myUserId);
		map.put("updIp", ip);
		
		if(orderUsedMileage != null && orderUsedMileage.length() >0){
			useMileageDao.insertUseMileage(map);
		}
		
		req.setAttribute("mainUrl", mainUrl);
		
		return moveUrl;
	}
}
