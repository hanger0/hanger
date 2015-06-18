package com.hanger.order.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanger.common.controller.BaseController;
import com.hanger.order.dao.CartUpdateAmountDao;

@Controller
public class CartUpdateAmountController extends BaseController {
	//
	private CartUpdateAmountDao cartUpdateAmountDao;

	public void setCartUpdateAmountDao(CartUpdateAmountDao cartUpdateAmountDao) {
		this.cartUpdateAmountDao = cartUpdateAmountDao;
	}
	
	@RequestMapping("/updateAmount.hang")
	public String name(HttpServletRequest req) {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
                || ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}
		
		String userCode = (String)session.getAttribute("myUserCode");
		String itemCode = req.getParameter("itemCode");
		String value = req.getParameter("value");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("itemCode", itemCode);
		map.put("amount", value);
		map.put("userCode", userCode);
		
		cartUpdateAmountDao.updateAmount(map);
		
		req.setAttribute("amount", value);
		
		return "order/UpdateAmount";
	}
}
