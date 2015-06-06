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
}
