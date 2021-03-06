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
	
	public int deleteCart(HashMap<String, String> map){
		return smct.delete("deleteCart", map);
	}
	
	public String selectAmount (HashMap<String, String> map){
		return (String)smct.queryForObject("selectAmount", map);
	}
	
	public int recomUpdate(HashMap<String, String> map){
		return smct.update("recomUpdate", map);
	}
}
