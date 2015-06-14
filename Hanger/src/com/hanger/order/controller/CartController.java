package com.hanger.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.CartDao;
import com.hanger.order.vo.CartVo;

@Controller
public class CartController extends BaseController {
	//
	private CartDao cartDao;

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	@RequestMapping(value="/cart.hang", method=RequestMethod.GET)
	public String myCart(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		String myUserCode = (String)session.getAttribute("myUserCode");
		ArrayList<CartVo> cartList = cartDao.selectCart(myUserCode);
		
		req.setAttribute("mainUrl", root + "order/CartList.jsp");
		req.setAttribute("cartList", cartList);
		
		return moveUrl;
	}
	
	@RequestMapping(value="/cart.hang", method=RequestMethod.POST)
	public String goCart(HttpServletRequest req){
		//
		HttpSession session = req.getSession();
		
		HashMap<String, String> cartMap = new HashMap<String, String>();
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String itemCode = req.getParameter("itemCode");
		String itemAmount = req.getParameter("itemAmount");
		String cartItemRecom = req.getParameter("cartItemRecom");
		String ip = req.getRemoteAddr();
		
		cartMap.put("userCode", myUserCode);
		cartMap.put("itemCode", itemCode);
		cartMap.put("itemAmount", itemAmount);
		cartMap.put("cartItemRecom", cartItemRecom);
		cartMap.put("regId", myUserId);
		cartMap.put("regIp", ip);
		cartMap.put("updId", myUserId);
		cartMap.put("updIp", ip);
		
		String message = "";
		
		try{
			cartDao.insertCart(cartMap);
			message = "성공했습니다.";
		} catch (DataIntegrityViolationException e){
			if(cartItemRecom != null){
				cartDao.recomUpdate(cartMap);
				message = "장바구니가 업데이트 되었습니다.";
			} else {
				message = "이미 장바구니에 담겨 있습니다.";
			}
		}

		req.setAttribute("message", message);
		
		return "order/CartMessage";
	}
}
