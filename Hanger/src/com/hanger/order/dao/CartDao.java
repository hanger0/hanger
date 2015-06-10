package com.hanger.order.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.order.vo.CartVo;

public class CartDao {
	//
	private SqlMapClientTemplate smct;
	
	public CartDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public void insertCart(HashMap<String, String> cart){
		smct.insert("insertCart", cart);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<CartVo> selectCart(String myUserCode){
		return (ArrayList<CartVo>)smct.queryForList("selectCart", myUserCode);
	}
}
