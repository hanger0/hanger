package com.hanger.item.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ItemSearchDao {
	private SqlMapClientTemplate smct;

	public ItemSearchDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public ArrayList getItemSearchList(HashMap numberMap) {
		
		return (ArrayList) smct.queryForList("getItemSearch", numberMap);
	}
	public ArrayList getCate2List(String cate1) {
		
		return (ArrayList) smct.queryForList("getCate2", cate1);
	}
	public ArrayList getCate3List(String cate2) {
		
		return (ArrayList) smct.queryForList("getCate3", cate2);
	}
	public ArrayList getSpecificCate3List(String cate3) {
		
		return (ArrayList) smct.queryForList("getSpecificCate3", cate3);
	}
}
