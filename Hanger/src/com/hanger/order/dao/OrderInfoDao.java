package com.hanger.order.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.order.vo.OrderVo;

public class OrderInfoDao {
	//
	private SqlMapClientTemplate smct;
	
	public OrderInfoDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<OrderVo> selectMyOrder(HashMap<String, String> map){
		return (ArrayList<OrderVo>)smct.queryForList("selectMyOrder", map);
	}
}
