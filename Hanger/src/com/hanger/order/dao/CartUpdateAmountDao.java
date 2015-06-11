package com.hanger.order.dao;

import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class CartUpdateAmountDao {
	//
	private SqlMapClientTemplate smct;

	public CartUpdateAmountDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public void updateAmount(HashMap<String, String> map){
		smct.update("updateAmount", map);
	}
}
