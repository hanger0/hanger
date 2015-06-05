package com.hanger.order.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.order.vo.CartVo;

public class CartDao {
	//
	private SqlMapClientTemplate smct;
	
	public CartDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public void insertCart(CartVo cart){
		smct.insert("insertCart", cart);
	}
}
