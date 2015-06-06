package com.hanger.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/cart.hang", method = RequestMethod.POST)
	public String addCart(HttpServletRequest req){
		//
		log("cart 컨트롤러");
		
		HttpSession session = req.getSession();
		
		String myUserCode = (String)session.getAttribute("myUserCode");
		String myUserId = (String)session.getAttribute("myUserId");
		String itemCode = req.getParameter("itemCode");
		String cartItemOption1 = req.getParameter("cartItemOption1");
		String cartItemOption2 = req.getParameter("cartItemOption2");
		String cartItemOption3 = req.getParameter("cartItemOption3");
		String cartItemAmount = req.getParameter("cartItemAmount");
		String cartItemRecom = req.getParameter("cartItemRecom");
		String ip = req.getRemoteAddr();
		
		CartVo cart = new CartVo();
		cart.setUserCode(myUserCode);
		cart.setItemCode(itemCode);
		cart.setCartItemOption1(cartItemOption1);
		cart.setCartItemOption2(cartItemOption2);
		cart.setCartItemOption3(cartItemOption3);
		cart.setCartItemAmount(cartItemAmount);
		cart.setCartItemRecom(cartItemRecom);
		cart.setRegId(myUserId);
		cart.setRegIp(ip);
		cart.setUpdId(myUserId);
		cart.setUpdIp(ip);
		
		cartDao.insertCart(cart);
		
		return moveUrl;
	}
}
