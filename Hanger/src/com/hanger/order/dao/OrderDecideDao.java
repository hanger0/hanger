package com.hanger.order.dao;

import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class OrderDecideDao {
	//
	private SqlMapClientTemplate smct;
	
	public OrderDecideDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public int orderDecide(HashMap<String, String> map){
		return smct.update("orderDecide", map);
	}
}
