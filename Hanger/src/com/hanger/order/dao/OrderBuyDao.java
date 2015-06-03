package com.hanger.order.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.order.vo.OrderVo;

public class OrderBuyDao {
	//
	private SqlMapClientTemplate smct;
	
	public OrderBuyDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public void insertOrdering(OrderVo order){
		smct.insert("insertOrdering", order);
	}
	
	public void insertOrderInfo(OrderVo order){
		smct.insert("insertOrderInfo", order);
	}
	
	public String selectSeq(){
		return (String)smct.queryForObject("selectSeq");
	}
}
