package com.hanger.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.CartDao;
import com.hanger.order.vo.CartVo;

@Controller
public class DeleteCartController extends BaseController {
	//
	private CartDao cartDao;
	
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	@RequestMapping(value="/deleteCart.hang", method=RequestMethod.POST)
	public String deleteCart(HttpServletRequest req){
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String userCode = (String)session.getAttribute("myUserCode");
		String itemCode = req.getParameter("deleteItemCode");
		
		HashMap<String, String> deleteCartMap = new HashMap<String, String>();
		
		deleteCartMap.put("userCode", userCode);
		deleteCartMap.put("itemCode", itemCode);
		
		cartDao.deleteCart(deleteCartMap);
		ArrayList<CartVo> catList = cartDao.selectCart(userCode);
		
		req.setAttribute("mainUrl", root + "order/CartList.jsp");
		req.setAttribute("cartList", catList);
		
		return moveUrl;
	}
}
